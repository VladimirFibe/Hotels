import SwiftUI

struct BookTotalView: View {
    let book: Book

    var body: some View {
        VStack(spacing: 16.0) {
            BookTotalRow(title: "Тур", value: book.tourPrice)
            BookTotalRow(title: "Топливный сбор", value: book.fuelCharge)
            BookTotalRow(title: "Сервисный сбор", value: book.serviceCharge)
            BookTotalRow(title: "К оплате", value: book.total, isTotal: true)
        }
        .padding(16)
        .hotelSectionModifier()
    }
}

struct BookTotalRow: View {
    var title: String
    var value: Int
    var isTotal = false
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text("\(value) ₽")
                .fontWeight(isTotal ? .semibold : .regular)
                .foregroundStyle(isTotal ? AppColor.blue.color : .primary)
        }
        .font(.system(size: 16))
    }
}

#Preview {
    BookTotalView(book: Book.example)
        .padding()
}
