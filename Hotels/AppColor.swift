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
    case orange = "orangeHotel"
    case blue = "blueHotel"
    case gray = "grayHotel"
    case lightGray = "lightGrayHotel"
    case orangeBackground
}
