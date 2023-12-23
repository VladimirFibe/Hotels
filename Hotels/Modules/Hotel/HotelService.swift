import Foundation

protocol HotelServiceProtocol {
    func fetchHotel() async throws -> Hotel
}

extension RESTClient: HotelServiceProtocol {
    func fetchHotel() async throws -> Hotel {
        try await request(.fetchHotel)
    }
}
