import Moya

extension TargetType {

    public var baseURL: URL {
        URL(string: (Bundle.main.infoDictionary?["API_BASE_PATH"] as? String)!)!
    }

    public var sampleData: Data {
        Data()
    }

    public var headers: [String : String]? {
        defaultHeaders
    }

    func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
    }
    
    public var defaultHeaders: [String: String]? {
        var _headers: [String: String] = [:]

        _headers[HeaderType.contentType.rawValue] = HeaderValue.applicationJson.rawValue
        _headers[HeaderType.acceptLanguage.rawValue] = Locale.current.languageCode
        _headers[HeaderType.screenDensity.rawValue] = UIScreen.main.scale.description

        return _headers
    }
}

