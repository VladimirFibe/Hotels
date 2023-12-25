import Foundation

protocol RoomServiceProtocol {
    func fetchRooms() async throws -> [Room]
}
extension RESTClient: RoomServiceProtocol {
    func fetchRooms() async throws -> [Room] {
        let response: RoomsResponse = try await request(.fetchRooms)
        return response.rooms
    }
}
