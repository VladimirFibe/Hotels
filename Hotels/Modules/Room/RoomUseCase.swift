import Foundation

protocol RoomUseCaseProtocol {
    func fetchRooms() async throws -> [Room]
}
final class RoomUseCase: RoomUseCaseProtocol {
    private let apiService: RoomServiceProtocol
    init(apiService: RoomServiceProtocol) {
        self.apiService = apiService
    }
    func fetchRooms() async throws -> [Room] {
        try await apiService.fetchRooms()
    }
}
