import SwiftUI

struct BookInfoView: View {
    let book: Book
    var nights: String {
        switch book.numberOfNights % 10 {
        case 1: return book.numberOfNights == 11 ? "11 ночей" : "\(book.numberOfNights) ночь"
        case 2, 3, 4, 22, 23, 24: return "\(book.numberOfNights) \(book.numberOfNights / 10 == 1 ? "ночей" : "ночи")"
        default: return "\(book.numberOfNights) ночей"
        }
    }
    var body: some View {
        VStack(spacing: 20.0) {
            BookInfoRow(title: "Вылет из", value: book.departure)
            BookInfoRow(title: "Страна, город", value: book.arrivalCountry)
            BookInfoRow(title: "Даты", value: "\(book.tourDateStart) – \(book.tourDateStop)")
            BookInfoRow(title: "Кол-во ночей", value: nights)
            BookInfoRow(title: "Отель", value: book.hotelName)
            BookInfoRow(title: "Номер", value: book.room)
            BookInfoRow(title: "Питание", value: book.nutrition)
        }
        .padding(16)
        .hotelSectionModifier()
    }
}

struct BookInfoRow: View {
    let title: String
    let value: String
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .frame(width: 150, alignment: .leading)
                .foregroundStyle(.secondary)
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    BookInfoView(book: Book.example)
        .padding(.horizontal)

}
