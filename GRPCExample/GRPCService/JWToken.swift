//
//  JSONWebToken.swift
//  uCommon
//
//  Created by Vladislav Maltsev on 06.05.2022.
//

import Foundation

enum JWTokenError: Error {
    case noPayloadSegment
    case failedToParseBase64
    case failedToParsePayload(Error)
}

struct JWToken<Payload: Decodable>: Codable {
    let token: String
    let payload: Payload

    init(token: String) throws {
        self.token = token

        let segments = token.components(separatedBy: ".")
        guard segments.indices.contains(1) else {
            throw JWTokenError.noPayloadSegment
        }

        let payloadSegment = segments[1]

        let base64 = payloadSegment
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        let padded = base64.padding(toLength: ((base64.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
        guard let payloadData = Data(base64Encoded: padded) else {
            throw JWTokenError.failedToParseBase64
        }

        do {
            let decoder = JSONDecoder()
            let payload = try decoder.decode(Payload.self, from: payloadData)
            self.payload = payload
        } catch {
            throw JWTokenError.failedToParsePayload(error)
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let token = try container.decode(String.self)
        try self.init(token: token)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(token)
    }
}
