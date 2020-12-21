//
// Created by José Moreira on 06/02/2020.
// Copyright (c) 2020 Bliss Applications. All rights reserved.
//

import Foundation

public struct BaseAPIErrorResponse: Codable, Error {
    public let errors: [BaseResponseError]
}

public struct BaseResponseError: Codable, LocalizedError {
    public var status: String
    public var code: String
    public var title: String
    public var detail: String

    public var errorDescription: String? {
        detail
    }
}
