import UIKit

public enum AppTheme: String {
    
    case light
    case dark
    
    public static var currentTheme: AppTheme {
        return themeDefinedByTheOS
    }

    private static var themeDefinedByTheOS: AppTheme {
        if #available(iOS 13.0, *, *) {
            switch UITraitCollection.current.userInterfaceStyle {
            case .dark: return .dark
            default: return .light
            }
        } else {
            return .light
        }
    }
    
    @available(iOS 12.0, *)
    public var uiUserInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .dark: return .dark
        default: return .light
        }
    }
}
