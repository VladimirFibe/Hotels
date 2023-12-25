import Foundation

final class BookViewModel: ObservableObject {
    @Published var book: Book? = Book.example
    var title: String {
        let total = book?.total ?? 0
        return "Оплатить \(total) ₽"
    }
}
