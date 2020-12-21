import Foundation

public struct TokenParameters: Codable {
    
    let clientId: String
    let grantType: String?
    let clientSecret: String?
    let username: String?
    let password: String?
    let scope: String?
    let refreshToken: String?
    
    public init(clientId: String,
                grantType: String,
                clientSecret: String? = nil,
                username: String? = nil,
                password: String? = nil,
                scope: String? = nil,
                refreshToken: String? = nil) {
        
        self.clientId = clientId
        self.grantType = grantType
        self.clientSecret = clientSecret
        self.username = username
        self.password = password
        self.scope = scope
        self.refreshToken = refreshToken
    }
    
    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case grantType = "grant_type"
        case clientSecret = "client_secret"
        case username
        case password
        case scope
        case refreshToken = "refresh_token"
    }
}

public enum ClientTypeParameter: String {
    // used to access data that is open
    case appClient = "app-client"
    // used to access sensible data that can be only accessed after a login
    case userClient = "user-client"
}
