//
//  Created by José Moreira on 04/02/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation

public enum APIError2: Error {
    case unknown
}

public enum APIError: String {
    case smsExpired = "5101"
    case userEmailNotConfirmedException = "5014"
    case userEmailNotRegisteredException = "5015"
    case userEmailAlreadyExistsError = "5016"
    case shoppingListNotSharedWithThisUser = "5021"
    case unknown
}

public enum GenericError: LocalizedError {
    case timeout
    case unknown
    case withMessage(message: String)

    public var errorDescription: String? {
        switch self {

        case .timeout:
            // TODO: Replace with localizable string
            return "Não é possível contactar o servidor, por favor tente mais tarde"

        case .unknown:
            // TODO: Replace with localizable string
            return "Ocorreu um erro! Por favor, tente mais tarde."

        case .withMessage(let msg):
            return msg
        }
    }

}
