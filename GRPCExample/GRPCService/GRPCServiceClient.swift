//
//  GRPCServiceClient.swift
//  uCommon
//
//  Created by Vladislav Maltsev on 05.05.2022.
//

import GRPC

public protocol GRPCServiceInterceptorsFactory {
}

public protocol GRPCServiceClient: GRPCClient {
    init(channel: GRPCChannel, interceptorsFactory: GRPCServiceInterceptorsFactory?)
}
