import SwiftUI

struct BookHeaderView: View {
    let book: Book
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HotelStarsView(rating: book.horating, name: book.ratingName)
            Text(book.hotelName)
                .font(.system(size: 22, weight: .medium))
            Text(book.hotelAdress)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppColor.blue.color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}

#Preview {
    BookHeaderView(book: Book.example)
}
