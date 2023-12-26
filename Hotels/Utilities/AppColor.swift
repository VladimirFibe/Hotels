import SwiftUI

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {
    var color: Color {
        Color(rawValue)
    }
    var uiColor: UIColor {
        UIColor.init(named: rawValue) ?? .white
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case orange = "xFFA800"
    case blue = "x0D72FF"
    case gray = "x828796"
    case lightGray = "xFBFBFC"
    case orangeBackground = "xFFC70020"
    case xF6F6F9
    case xE8E9EC
}
