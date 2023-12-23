import Foundation

protocol HotelUseCaseProtocol {
    func fetchHotel() async throws -> Hotel
}
final class HotelUseCase: HotelUseCaseProtocol {
    private let apiService: HotelServiceProtocol
    init(apiService: HotelServiceProtocol) {
        self.apiService = apiService
    }
    func fetchHotel() async throws -> Hotel {
        try await apiService.fetchHotel()
    }
}
