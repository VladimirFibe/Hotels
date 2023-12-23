import Foundation

enum RESTRoute {
    case fetchHotel

    var url: URL? {
        switch self {
        case .fetchHotel:
            return URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")
        }
    }
}
