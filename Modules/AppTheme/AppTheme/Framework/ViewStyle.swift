import UIKit

public class ViewStyle: Decodable, StyleSheetComponent {
    
    private let backgroundColorStr: String?
    private let borderColorStr: String?
    
    public let styleName: String?
    public let cornerRadius: CGFloat?
    public let borderWidth: CGFloat?
    public let isCircular: Bool?
    private let _tintColor: String?
    
    public var backgroundColor: UIColor? {
        guard let backgroundColorStr = backgroundColorStr else { return nil }
        return AppStyleSheet.shared.color(withName: backgroundColorStr)?.uiColor
    }
    
    public var borderColor: UIColor? {
        guard let borderColorStr = borderColorStr else { return nil }
        return AppStyleSheet.shared.color(withName: borderColorStr)?.uiColor
    }
    
    public var tintColor: UIColor? {
        guard let _tintColor = _tintColor else { return nil }
        return AppStyleSheet.shared.color(withName: _tintColor)?.uiColor
    }
   
    private enum CodingKeys: String, CodingKey {
        case styleName
        case cornerRadius
        case borderWidth
        case backgroundColorStr = "backgroundColor"
        case borderColorStr = "borderColor"
        case isCircular
        case _tintColor = "tintColor"
    }
   
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        styleName = try container.decodeIfPresent(String.self, forKey: .styleName)
        backgroundColorStr = try container.decodeIfPresent(String.self, forKey: .backgroundColorStr)
        cornerRadius = try container.decodeIfPresent(CGFloat.self, forKey: .cornerRadius)
        borderWidth = try container.decodeIfPresent(CGFloat.self, forKey: .borderWidth)
        borderColorStr = try container.decodeIfPresent(String.self, forKey: .borderColorStr)
        isCircular = try container.decodeIfPresent(Bool.self, forKey: .isCircular)
        _tintColor = try container.decodeIfPresent(String.self, forKey: ._tintColor)
    }
}

