//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: streams_services.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `StgStreamsClient`, then call methods of this protocol to make API calls.
public protocol StgStreamsClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: StgStreamsClientInterceptorFactoryProtocol? { get }

  func getStreamIdByCode(
    _ request: SwiftProtobuf.Google_Protobuf_StringValue,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_StringValue, SwiftProtobuf.Google_Protobuf_StringValue>

  func getStream(
    _ request: SwiftProtobuf.Google_Protobuf_StringValue,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_StringValue, GetStreamResponse>

  func getAvailableMultistreams(
    _ request: GetAvailableMultistreamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<GetAvailableMultistreamsRequest, GetAvailableMultistreamsResponse>

  func setMultistream(
    _ request: SetMultistreamRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<SetMultistreamRequest, SetMultistreamResponse>

  func getAvailableMultistreamsV2(
    _ request: GetAvailableMultistreamsRequestV2,
    callOptions: CallOptions?
  ) -> UnaryCall<GetAvailableMultistreamsRequestV2, GetAvailableMultistreamsResponseV2>

  func setMultistreamV2(
    _ request: SetMultistreamRequestV2,
    callOptions: CallOptions?
  ) -> UnaryCall<SetMultistreamRequestV2, SetMultistreamResponseV2>

  func publishMultistreamInstagram(
    _ request: PublishMultistreamInstagramRequest,
    callOptions: CallOptions?,
    handler: @escaping (PublishMultistreamInstagramResponse) -> Void
  ) -> ServerStreamingCall<PublishMultistreamInstagramRequest, PublishMultistreamInstagramResponse>

  func startStream(
    _ request: StartStreamRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<StartStreamRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func startStreamV2(
    _ request: StartStreamRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<StartStreamRequest, StartStreamResponse>

  func finishStream(
    _ request: FinishStreamRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<FinishStreamRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func finishStreamV2(
    _ request: FinishStreamRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<FinishStreamRequest, FinishStreamResponse>

  func getStreamEvents(
    _ request: GetStreamEventsRequest,
    callOptions: CallOptions?,
    handler: @escaping (GetStreamEventsResponse) -> Void
  ) -> ServerStreamingCall<GetStreamEventsRequest, GetStreamEventsResponse>
}

extension StgStreamsClientProtocol {
  public var serviceName: String {
    return "StgStreams"
  }

  /// Unary call to getStreamIdByCode
  ///
  /// - Parameters:
  ///   - request: Request to send to getStreamIdByCode.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getStreamIdByCode(
    _ request: SwiftProtobuf.Google_Protobuf_StringValue,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_StringValue, SwiftProtobuf.Google_Protobuf_StringValue> {
    return self.makeUnaryCall(
      path: "/StgStreams/getStreamIdByCode",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetStreamIdByCodeInterceptors() ?? []
    )
  }

  /// Unary call to getStream
  ///
  /// - Parameters:
  ///   - request: Request to send to getStream.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getStream(
    _ request: SwiftProtobuf.Google_Protobuf_StringValue,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_StringValue, GetStreamResponse> {
    return self.makeUnaryCall(
      path: "/StgStreams/getStream",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetStreamInterceptors() ?? []
    )
  }

  /// Unary call to getAvailableMultistreams
  ///
  /// - Parameters:
  ///   - request: Request to send to getAvailableMultistreams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getAvailableMultistreams(
    _ request: GetAvailableMultistreamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<GetAvailableMultistreamsRequest, GetAvailableMultistreamsResponse> {
    return self.makeUnaryCall(
      path: "/StgStreams/getAvailableMultistreams",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetAvailableMultistreamsInterceptors() ?? []
    )
  }

  /// Unary call to setMultistream
  ///
  /// - Parameters:
  ///   - request: Request to send to setMultistream.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func setMultistream(
    _ request: SetMultistreamRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SetMultistreamRequest, SetMultistreamResponse> {
    return self.makeUnaryCall(
      path: "/StgStreams/setMultistream",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makesetMultistreamInterceptors() ?? []
    )
  }

  /// Unary call to getAvailableMultistreamsV2
  ///
  /// - Parameters:
  ///   - request: Request to send to getAvailableMultistreamsV2.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getAvailableMultistreamsV2(
    _ request: GetAvailableMultistreamsRequestV2,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<GetAvailableMultistreamsRequestV2, GetAvailableMultistreamsResponseV2> {
    return self.makeUnaryCall(
      path: "/StgStreams/getAvailableMultistreamsV2",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetAvailableMultistreamsV2Interceptors() ?? []
    )
  }

  /// Unary call to setMultistreamV2
  ///
  /// - Parameters:
  ///   - request: Request to send to setMultistreamV2.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func setMultistreamV2(
    _ request: SetMultistreamRequestV2,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SetMultistreamRequestV2, SetMultistreamResponseV2> {
    return self.makeUnaryCall(
      path: "/StgStreams/setMultistreamV2",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makesetMultistreamV2Interceptors() ?? []
    )
  }

  /// Server streaming call to publishMultistreamInstagram
  ///
  /// - Parameters:
  ///   - request: Request to send to publishMultistreamInstagram.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func publishMultistreamInstagram(
    _ request: PublishMultistreamInstagramRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (PublishMultistreamInstagramResponse) -> Void
  ) -> ServerStreamingCall<PublishMultistreamInstagramRequest, PublishMultistreamInstagramResponse> {
    return self.makeServerStreamingCall(
      path: "/StgStreams/publishMultistreamInstagram",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makepublishMultistreamInstagramInterceptors() ?? [],
      handler: handler
    )
  }

  ///*
  /// Deprecated, use startStreamV2 instead (return type changed from Empty to StartStreamResponse)
  ///
  /// - Parameters:
  ///   - request: Request to send to startStream.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func startStream(
    _ request: StartStreamRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<StartStreamRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: "/StgStreams/startStream",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makestartStreamInterceptors() ?? []
    )
  }

  /// Unary call to startStreamV2
  ///
  /// - Parameters:
  ///   - request: Request to send to startStreamV2.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func startStreamV2(
    _ request: StartStreamRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<StartStreamRequest, StartStreamResponse> {
    return self.makeUnaryCall(
      path: "/StgStreams/startStreamV2",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makestartStreamV2Interceptors() ?? []
    )
  }

  ///*
  /// Deprecated, use finishStreamV2 instead (return type changed from Empty to FinishStreamResponse)
  ///
  /// - Parameters:
  ///   - request: Request to send to finishStream.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func finishStream(
    _ request: FinishStreamRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<FinishStreamRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: "/StgStreams/finishStream",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makefinishStreamInterceptors() ?? []
    )
  }

  /// Unary call to finishStreamV2
  ///
  /// - Parameters:
  ///   - request: Request to send to finishStreamV2.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func finishStreamV2(
    _ request: FinishStreamRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<FinishStreamRequest, FinishStreamResponse> {
    return self.makeUnaryCall(
      path: "/StgStreams/finishStreamV2",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makefinishStreamV2Interceptors() ?? []
    )
  }

  /// Server streaming call to getStreamEvents
  ///
  /// - Parameters:
  ///   - request: Request to send to getStreamEvents.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func getStreamEvents(
    _ request: GetStreamEventsRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (GetStreamEventsResponse) -> Void
  ) -> ServerStreamingCall<GetStreamEventsRequest, GetStreamEventsResponse> {
    return self.makeServerStreamingCall(
      path: "/StgStreams/getStreamEvents",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetStreamEventsInterceptors() ?? [],
      handler: handler
    )
  }
}

public protocol StgStreamsClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getStreamIdByCode'.
  func makegetStreamIdByCodeInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_StringValue, SwiftProtobuf.Google_Protobuf_StringValue>]

  /// - Returns: Interceptors to use when invoking 'getStream'.
  func makegetStreamInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_StringValue, GetStreamResponse>]

  /// - Returns: Interceptors to use when invoking 'getAvailableMultistreams'.
  func makegetAvailableMultistreamsInterceptors() -> [ClientInterceptor<GetAvailableMultistreamsRequest, GetAvailableMultistreamsResponse>]

  /// - Returns: Interceptors to use when invoking 'setMultistream'.
  func makesetMultistreamInterceptors() -> [ClientInterceptor<SetMultistreamRequest, SetMultistreamResponse>]

  /// - Returns: Interceptors to use when invoking 'getAvailableMultistreamsV2'.
  func makegetAvailableMultistreamsV2Interceptors() -> [ClientInterceptor<GetAvailableMultistreamsRequestV2, GetAvailableMultistreamsResponseV2>]

  /// - Returns: Interceptors to use when invoking 'setMultistreamV2'.
  func makesetMultistreamV2Interceptors() -> [ClientInterceptor<SetMultistreamRequestV2, SetMultistreamResponseV2>]

  /// - Returns: Interceptors to use when invoking 'publishMultistreamInstagram'.
  func makepublishMultistreamInstagramInterceptors() -> [ClientInterceptor<PublishMultistreamInstagramRequest, PublishMultistreamInstagramResponse>]

  /// - Returns: Interceptors to use when invoking 'startStream'.
  func makestartStreamInterceptors() -> [ClientInterceptor<StartStreamRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'startStreamV2'.
  func makestartStreamV2Interceptors() -> [ClientInterceptor<StartStreamRequest, StartStreamResponse>]

  /// - Returns: Interceptors to use when invoking 'finishStream'.
  func makefinishStreamInterceptors() -> [ClientInterceptor<FinishStreamRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'finishStreamV2'.
  func makefinishStreamV2Interceptors() -> [ClientInterceptor<FinishStreamRequest, FinishStreamResponse>]

  /// - Returns: Interceptors to use when invoking 'getStreamEvents'.
  func makegetStreamEventsInterceptors() -> [ClientInterceptor<GetStreamEventsRequest, GetStreamEventsResponse>]
}

public final class StgStreamsClient: StgStreamsClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: StgStreamsClientInterceptorFactoryProtocol?

  /// Creates a client for the StgStreams service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: StgStreamsClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

