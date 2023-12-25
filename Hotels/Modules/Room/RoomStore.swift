import Foundation

enum RoomEvent {
    case done([Room])
}

enum RoomAction {
    case fetch
}

final class RoomStore: Store<RoomEvent, RoomAction> {
    private let useCase: RoomUseCaseProtocol

    init(useCase: RoomUseCaseProtocol) {
        self.useCase = useCase
    }

    override func handleActions(action: RoomAction) {
        switch action {
        case .fetch:
            statefulCall { [weak self] in
                try await self?.fetchRooms()
            }

        }
    }

    private func fetchRooms() async throws {
        let rooms = try await useCase.fetchRooms()
        sendEvent(.done(rooms))
    }
}
