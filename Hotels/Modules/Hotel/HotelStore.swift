import Foundation

enum HotelEvent {
    case done(Hotel)
}

enum HotelAction {
    case fetch
}

final class HotelStore: Store<HotelEvent, HotelAction> {
    private let useCase: HotelUseCaseProtocol

    init(useCase: HotelUseCaseProtocol) {
        self.useCase = useCase
    }

    override func handleActions(action: HotelAction) {
        switch action {
        case .fetch:
            statefulCall { [weak self] in
                try await self?.fetchHotel()
            }

        }
    }

    private func fetchHotel() async throws {
        let hotel = try await useCase.fetchHotel()
        sendEvent(.done(hotel))
    }
}
