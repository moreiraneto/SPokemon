import Foundation
import Moya

public struct Logger {
    public static let shared = Logger()
    public var isLoggerEnabled: Bool = true

    private enum Environment: String {
        case production
        case developer
        case staging
    }

    private var isProductionApp: Bool {
        if let environment = Bundle.main.infoDictionary?["TARGET_ENVIRONMENT"] as? String {
            return environment == Environment.production.rawValue
        }
        return false
    }

    private init() {}

    public func logMappingObjectError(_ error: MoyaError) {
        let logInfo = "MAPPING ERROR: \(error.errorUserInfo)"
        log(with: logInfo)

    }

    public func log(with message: String = "",
                    function: StaticString = #function,
                    file: StaticString = #file,
                    line: Int = #line,
                    forceFix: Bool = false) {
        guard (onSimulator || onDebug || !isProductionApp) && isLoggerEnabled  else { return }

        print(setupLoggerMessage(message: message, function: function, file: file))
        if forceFix {
            fatalError("This need to be fixed now!")
        }
    }

    private func setupLoggerMessage(message: String,
                                    function: StaticString = #function,
                                    file: StaticString = #file,
                                    line: UInt = #line,
                                    short: Bool = false,
                                    prefix: String = "") -> String {

        guard let fileName = "\(file)".components(separatedBy: "/").last else {
            return ""
        }

        var log = "\n[LOGGER STARTED]\n"
        log += "##############################\n"

        if short {
            log += "\(fileName)"
        } else {
            if !prefix.isEmpty {
                log += "\(prefix) | func [\(function)] in file [\(fileName)]"
            } else {
                log += "Line\(line), \(function) @ \(fileName)"
            }
        }
        log += "\nMessage: \(message)"
        log += "\n##############################\n"
        log += "[LOGGER ENDED]\n"
        return log
    }

    public var onSimulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }

    public var onDebug: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
}

extension String {
    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}
