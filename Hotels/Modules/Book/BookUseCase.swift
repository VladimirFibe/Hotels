import Foundation

protocol BookUseCaseProtocol {
    func fetchBook() async throws -> Book
}
final class BookUseCase: BookUseCaseProtocol {
    private let apiService: BookServiceProtocol
    init(apiService: BookServiceProtocol) {
        self.apiService = apiService
    }
    func fetchBook() async throws -> Book {
        try await apiService.fetchBook()
    }
}
