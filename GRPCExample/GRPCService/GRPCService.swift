//
//  GRPCService.swift
//  uCommon
//
//  Created by Vladislav Maltsev on 05.05.2022.
//

import Foundation
import GRPC
import NIO
import NIOHPACK
import Network

public enum GRPCServiceError: Error {
    case notAuthorized
}

public class GRPCService {

    public struct Options {
        public static let defaultTimeout: TimeInterval = 12

        public var authorized: Bool
        public var timeout: TimeInterval?
        public var errorMapper: ErrorMapper?

        public init(
            authorized: Bool,
            timeout: TimeInterval? = defaultTimeout,
            errorMapper: ErrorMapper? = nil
        ) {
            self.authorized = authorized
            self.timeout = timeout
            self.errorMapper = errorMapper
        }

        public static var authorized: Options = .init(authorized: true)
        public static var unauthorized: Options = .init(authorized: false)
    }

    private let defaultConnectionGroup: EventLoopGroup
    private let host: String
    private let port: Int
    private let networkMonitor = NWPathMonitor()
    public var connection: GRPCChannel!
    public let debugDelegate = DebugDelegate()

    public init(
        host: String,
        port: Int
    ) {
        self.host = host
        self.port = port
        defaultConnectionGroup = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        connection = makeConnection()
    }

    public func call<Client: GRPCServiceClient, Request, Response>(
        method: @escaping (Client) -> (Request, CallOptions) -> UnaryCall<Request, Response>,
        request: Request,
        options: Options
    ) -> EventLoopFuture<Response> {
        call(options: options) { connection, callOptions -> EventLoopFuture<Response> in
            let client = Client(channel: connection, interceptorsFactory: nil)
            let clientMethod = method(client)
            return clientMethod(request, callOptions).response
        }
    }

    public func startStream<Client: GRPCServiceClient, ConnectRequest, StreamEvent>(
        method: (Client)
            -> (ConnectRequest, CallOptions?, @escaping (StreamEvent) -> Void)
            -> ServerStreamingCall<ConnectRequest, StreamEvent>,
        request: ConnectRequest,
        options: Options,
        eventHandler: @escaping (StreamEvent) -> Void
    ) -> ServerStreamingCall<ConnectRequest, StreamEvent> {
        let client = Client(channel: self.connection, interceptorsFactory: nil)
        let clientMethod = method(client)
        return clientMethod(request, callOptions(for: options), eventHandler)
    }

    private func call<Response>(
        options: Options,
        call: @escaping (GRPCChannel, CallOptions) -> EventLoopFuture<Response>
    ) -> EventLoopFuture<Response> {
        let makeCall = {
            call(self.connection, self.callOptions(for: options))
                .flatMapErrorWithEventLoop { error, eventLoop in
                    if let errorMapper = options.errorMapper {
                        return eventLoop.makeFailedFuture(errorMapper.error(from: error))
                    } else {
                        return eventLoop.makeFailedFuture(error)
                    }
                }
        }

        if options.authorized {
            return ensureAuthorization(options: options, makeCall)
        } else {
            return makeCall()
        }
    }

    private func ensureAuthorization<Response>(
        options: Options,
        _ makeCall: @escaping () -> EventLoopFuture<Response>
    ) -> EventLoopFuture<Response> {
        makeCall()
    }

    private func callOptions(for options: GRPCService.Options) -> CallOptions {
        var customMetadata: HPACKHeaders = .init()

        customMetadata.add(
            name: "locale",
            value: "--"
        )

        let timeLimit: TimeLimit
        if let timeout = options.timeout {
            timeLimit = .timeout(.seconds(Int64(timeout)))
        } else {
            timeLimit = .none
        }

        let options = CallOptions(
            customMetadata: customMetadata,
            timeLimit: timeLimit
        )

        return options
    }

    private func makeConnection() -> GRPCChannel  {
        let useSingleConnection = true
        if useSingleConnection {
            return ClientConnection
                .usingPlatformAppropriateTLS(for: defaultConnectionGroup)
                .withConnectionBackoff(multiplier: 1.1)
                .withConnectionBackoff(maximum: .minutes(1))
                .withConnectionTimeout(minimum: .seconds(Int64(Options.defaultTimeout)))
                .withErrorDelegate(debugDelegate)
                .withConnectivityStateDelegate(debugDelegate)
                .connect(host: host, port: port)
        } else {
            var configuration = GRPCChannelPool.Configuration.with(
                target: .host(host, port: port),
                transportSecurity: .tls(.makeClientDefault(compatibleWith: defaultConnectionGroup)),
                eventLoopGroup: defaultConnectionGroup
            )
            configuration.errorDelegate = debugDelegate
            return try! GRPCChannelPool.with(configuration: configuration)
        }
    }

    private func subscribeToNetworkStatus() {
        networkMonitor.start(queue: .global(qos: .utility))
        networkMonitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            _ = self.connection?.close()

            switch path.status {
            case .satisfied, .requiresConnection:
                self.connection = self.makeConnection()
            case .unsatisfied:
                self.connection = nil
            @unknown default:
                self.connection = self.makeConnection()
            }
        }
    }
}

import UIKit
import Logging

public final class DebugDelegate: ConnectivityStateDelegate, ClientErrorDelegate {

    private var handleError: ((Error) -> Void)?
    private var handleConectivityState: ((ConnectivityState) -> Void)?

    public func initializeIfNeeded(
        handleError: @escaping (Error) -> Void,
        handleConnectivityState: ((ConnectivityState) -> Void)?
    ) {
        self.handleError = handleError
        self.handleConectivityState = handleConnectivityState
    }

    public func connectivityStateDidChange(from oldState: ConnectivityState, to newState: ConnectivityState) {
        handleConectivityState?(newState)
    }

    public func didCatchError(_ error: Error, logger: Logger, file: StaticString, line: Int) {
        handleError?(error)
    }
}
