//
//  DemoInteractor.swift
//  GRPCExample
//
//  Created by Vladislav Maltsev on 21.11.2022.
//

import NIOCore
import SwiftProtobuf
import Network

final class DemoInteractor {
    private lazy var grpcService = GRPCService(host: "mobile-dev.livecom.tech", port: 443)
    let monitor = NWPathMonitor()
    var logs: [String] = []

    init() {
    }

    func sendRequest(_ completion: @escaping (Result<String, Error>) -> Void) {
        fetchStreamId(by: "000000").whenCompleteBlocking(onto: .main) { result in
            completion(result)
        }
    }

    func subscribeToStatus(
        handleConnectivityStatus: @escaping (String) -> Void,
        handleError: @escaping (String) -> Void
    ) {
        grpcService.debugDelegate.initializeIfNeeded { error in
            handleError("\(error)")
        } handleConnectivityState: { state in
            handleConnectivityStatus("\(state)")
        }
    }

    func subscribeToNetworkStatus(handleNetworkStatusChange: @escaping (String) -> Void) {
        monitor.start(queue: .global(qos: .utility))
        monitor.pathUpdateHandler = { path in
            handleNetworkStatusChange(path.debugDescription)
        }
    }

    private func fetchStreamId(by code: String) -> EventLoopFuture<String> {
        let request = Google_Protobuf_StringValue(code)
        let response = grpcService.call(
            method: StgStreamsClient.getStreamIdByCode,
            request: request,
            options: .unauthorized
        )

        return response.map { $0.value }
    }
}
