import Foundation

enum HeaderType: String {
    case authorization = "Authorization"
    case accessToken = "x-access-token"
    case refreshToken = "x-refresh-token"
    case authType = "x-auth-type"
    case authenticate = "Www-Authenticate"
    case accept = "Accept"
    case locale = "x-locale"
    case appVersion = "x-app-version"
    case deviceVersion = "x-device-version"
    case screenDensity = "x-screen-density"
    case contentType = "Content-Type"
    case acceptLanguage = "Accept-Language"
    case scope = "scope"
}

enum HeaderValue: String {
    case urlEncoded = "application/x-www-form-urlencoded"
    case applicationJson = "application/json"
    case acceptLanguagePt = "pt"
}

