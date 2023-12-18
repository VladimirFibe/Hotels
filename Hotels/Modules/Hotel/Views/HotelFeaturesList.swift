import SwiftUI

struct HotelFeaturesList: View {
    var body: some View {
        VStack {
            ForEach(HotelFeature.all) { item in
                VStack(spacing: 10.0) {
                    HStack(spacing: 12.0) {
                        item.image
                        VStack(alignment: .leading, spacing: 2.0) {
                            Text(item.title)
                                .font(.system(size: 16, weight: .medium))
                            Text("Самое необходимое")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(AppColor.gray.color)

                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Rectangle()
                        .frame(height: 1)
                        .padding(.leading, 37)
                        .foregroundStyle(AppColor.gray.color)
                        .opacity(0.15)
                }
            }
        }
    }
}

struct HotelFeaturesList_Previews: PreviewProvider {
    static var previews: some View {
        HotelFeaturesList()
    }
}

struct HotelFeature: Identifiable {
    let id = UUID().uuidString
    let title: String
    let image: Image

    static let all: [HotelFeature] = [
        .init(title: "Удобства", image: AppImage.emojiHappy.image),
        .init(title: "Что включено", image: AppImage.tickSquare.image),
        .init(title: "Что не включено", image: AppImage.closeSquare.image)
    ]
}
