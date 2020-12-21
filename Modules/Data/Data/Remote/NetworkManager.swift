import Moya
import RxSwift
import Alamofire
import Domain
import Common

class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

public class NetworkManager {
    public static let shared = NetworkManager()
    private let provider: MoyaProvider<MultiTarget>
    private let errorsKeyPath = "errors"
    
    private init() {
        var plugins: [PluginType] = []
        #if DEBUG
        plugins = [NetworkLoggerPlugin(verbose: true)]
        #endif
        provider = MoyaProvider<MultiTarget>(manager: DefaultAlamofireManager.sharedManager,
                                             plugins: plugins)
    }
    
    var baseURL: String = Bundle.main.infoDictionary?["API_BASE_PATH"]! as! String

    // MARK: - generic function to fetch data

    public func fetchData<Type: Decodable>(fromApi api: TargetType,
                                           decodeFromKeyPath keyPath: String? = nil) -> Single<Type> {
        
        let request = MultiTarget(api)

        let response = provider.rx.request(request)

        return convert(response, into: Type.self, atKeyPath: keyPath)
    }
    
    // converts a Single<Response> to a decodable type
    private func convert<Type: Decodable>(_ response: Single<Response>,
                                          into type: Type.Type,
                                          atKeyPath keyPath: String? = nil,
                                          usingDecoder decoder: JSONDecoder = JSONDecoder(),
                                          failsOnEmptyData: Bool = true) -> Single<Type> {
        
        response.flatMap({ (response) -> Single<Type> in
            do {
                return Single.just(try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData))
            } catch {
                if let moyaError = error as? MoyaError {
                    Logger.shared.logMappingObjectError(moyaError)
                } else {
                    // TODO: log other errors
                }
                return Single.error(GenericError.unknown)
            }
        })
    }
}
