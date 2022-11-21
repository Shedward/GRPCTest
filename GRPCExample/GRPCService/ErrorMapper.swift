//
//  ErrorMapper.swift
//  uCommon
//
//  Created by Vladislav Maltsev on 12.05.2022.
//

import GRPC

/// Temporary solution for extracting information about errors from backend
/// Should be replaced with propper error description policy when backend will be ready
public protocol ErrorMapper {
    func error(from originalError: Error) -> Error
}

public struct GRPCStatusCodeMapper: ErrorMapper {
    private let errorMap: [GRPCStatus.Code: Error]

    public init(_ errorMap: [GRPCStatus.Code: Error]) {
        self.errorMap = errorMap
    }

    public func error(from originalError: Error) -> Error {
        if let status = originalError as? GRPCStatus, let errorFromMap = errorMap[status.code] {
            return errorFromMap
        } else {
            return originalError
        }
    }
}
