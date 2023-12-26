import Foundation

final class BookViewModel: ObservableObject {
    @Published var book: Book? // = Book.example
    @Published var phone = "+7"
    @Published var mail = ""

    var title: String {
        let total = book?.total ?? 0
        return "Оплатить \(total) ₽"
    }

    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: mail)
    }
}
