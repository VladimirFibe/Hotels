import Foundation

enum RESTRoute {
    case fetchHotel
    case fetchRooms
    case fetchBook

    var url: URL? {
        switch self {
        case .fetchHotel:
            return URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")
        case .fetchRooms: 
            return URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")
        case .fetchBook:
            return URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")
        }
    }
}
