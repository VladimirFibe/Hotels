import Foundation

protocol BookServiceProtocol {
    func fetchBook() async throws -> Book
}
extension RESTClient: BookServiceProtocol {
    func fetchBook() async throws -> Book {
        try await request(.fetchBook)
    }
}
