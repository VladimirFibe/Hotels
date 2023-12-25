import Foundation

enum BookEvent {
    case done(Book)
}

enum BookAction {
    case fetch
}

final class BookStore: Store<BookEvent, BookAction> {
    private let useCase: BookUseCaseProtocol

    init(useCase: BookUseCaseProtocol) {
        self.useCase = useCase
    }

    override func handleActions(action: BookAction) {
        switch action {
        case .fetch:
            statefulCall { [weak self] in
                try await self?.fetchBook()
            }

        }
    }

    private func fetchBook() async throws {
        let book = try await useCase.fetchBook()
        sendEvent(.done(book))
    }
}
