import SwiftUI

struct HotelContentView: View {
    let hotel: Hotel
    var tags: [Tag] {
        hotel.aboutTheHotel.peculiarities.map { Tag(text: $0)}
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
            TagsView(tags: tags)
            Text(hotel.aboutTheHotel.description)
                .font(.system(size: 16))
            HotelFeaturesList()

        }
        .padding(16)
    }
}

#Preview {
    HotelContentView(hotel: Hotel.example)
}
