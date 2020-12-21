import Foundation
import Moya
import RxSwift
import Domain

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {

    func parseError<E>(response: Response) -> Single<E> {
        if response.statusCode == 401 {
            // TODO
        }

        let decoder = JSONDecoder()
        if let errors = try? response.map([BaseResponseError].self, atKeyPath: "errors", using: decoder,
                failsOnEmptyData: true) {
            return Single.error(BaseAPIErrorResponse(errors: errors))
        }

        return Single.error(APIError2.unknown)
    }

    func isTokenExpiredError(_ error: Error) -> Bool {
        if let moyaError = error as? MoyaError {
            switch moyaError {
            case .statusCode(let response):
                if response.statusCode != 401 {
                    return false
                } else if response.data.count == 0 {
                    return true
                }
            default:
                break
            }
        }
        return false
    }

    func filterUnauthorized() -> Single<E> {
        flatMap { (response) -> Single<E> in
            if 200...299 ~= response.statusCode {
                return Single.just(response)
            } else if response.statusCode == 404 {
                return Single.just(response)
            } else {
                return Single.error(MoyaError.statusCode(response))
            }
        }
    }

    func filterStatusCode() -> Single<E> {
        flatMap { (response) -> Single<E> in
            if 200...299 ~= response.statusCode {
                return Single.just(response)
            } else {
                return self.parseError(response: response)
            }
        }
    }
}

