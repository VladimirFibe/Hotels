import SwiftUI

struct HotelStarsView: View {
    let rating: Int
    let name: String
    var body: some View {
        HStack(spacing: 2.0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
            Text("\(rating)")
            Text(name)
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundStyle(AppColor.orange.color)
        .frame(height: 29)
        .padding(.horizontal, 10)
        .background(AppColor.orangeBackground.color, in: .rect(cornerRadius: 5))
    }
}

#Preview {
    HotelStarsView(rating: 5, name: "Превосходно")
}
