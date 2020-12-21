import Foundation

protocol StyleSheetComponent {
    static func stylesFilename(forTheme theme: AppTheme?) -> String
}

extension StyleSheetComponent {
    
    static func stylesFilename(forTheme theme: AppTheme?) -> String {
        var basePath = "AppStyle-\(String(describing: self))"
        if let theme = theme { basePath += "-\(theme.rawValue.capitalized)" }
        return basePath
    }
}
