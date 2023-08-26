import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        guard let color = UIColor.init(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case blue
    case celeste
    case black
    case white
    case lightGray
    case gray
    case darkGray
    case background
    case lightBlue
    case gray60
    case gray20
    case mediumGray
    case text
}
