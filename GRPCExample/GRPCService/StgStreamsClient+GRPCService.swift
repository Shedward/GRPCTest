//
//  StgStreamsClient+GRPCService.swift
//  StreamingSDK
//
//  Created by Vladislav Maltsev on 25.07.2022.
//

import GRPC

extension StgStreamsClient: GRPCServiceClient {

    convenience public init(
        channel: GRPCChannel,
        interceptorsFactory: GRPCServiceInterceptorsFactory?
    ) {
        self.init(
            channel: channel,
            defaultCallOptions: CallOptions(),
            interceptors: interceptorsFactory as? StgStreamsClientInterceptorFactoryProtocol
        )
    }
}
