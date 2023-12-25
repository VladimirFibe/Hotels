import SwiftUI

struct HotelHeaderView: View {
    let hotel: Hotel
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            PhotoGalleryView(imageUrls: hotel.imageUrls)
            VStack(alignment: .leading, spacing: 16.0) {
                HotelStarsView(rating: hotel.rating, name: hotel.ratingName)
                Text(hotel.name)
                    .font(.system(size: 22, weight: .medium))
                Text(hotel.adress)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(AppColor.blue.color)
                HStack(alignment: .firstTextBaseline) {
                    Text("от \(hotel.minimalPrice) ₽")
                        .font(.system(size: 30, weight: .semibold))
                    Text(hotel.priceForIt)
                        .foregroundStyle(AppColor.gray.color)
                }
            }
            .padding(.horizontal, 16)
        }

    }
}

#Preview {
    VStack {
        HotelHeaderView(hotel: Hotel.example)
        Spacer()
    }
}
