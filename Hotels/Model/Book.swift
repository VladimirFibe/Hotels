import Foundation

struct Book: Codable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int

    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room
        case nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }

    var total: Int {
        tourPrice + fuelCharge + serviceCharge
    }

    static let example = Book(id: 1, hotelName: "Лучший пятизвездочный отель в Хургаде, Египет", hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет", horating: 5, ratingName: "Превосходно", departure: "Москва", arrivalCountry: "Египет, Хургада", tourDateStart: "19.09.2023", tourDateStop: "27.09.2023", numberOfNights: 1, room: "Люкс номер с видом на море", nutrition: "Все включено", tourPrice: 289400, fuelCharge: 9300, serviceCharge: 2150)
}
