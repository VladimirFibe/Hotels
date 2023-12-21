import SwiftUI

struct HotelView: View {
    var action: Callback?
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 16.0) {
                header
                about
                button
            }
        }
    }

    var button: some View {
        Button {
            action?()
        } label: {
            Text("К выбору номера")
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 15).fill(AppColor.blue.color))
                .padding(.horizontal, 16)
        }

    }

    var about: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
                .padding(.horizontal, 16)
            TagsView()
                .padding(.leading, 12)
            Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
                .font(.system(size: 16))
                .padding(.horizontal, 16)
            HotelFeaturesList()
                .padding(.horizontal, 16)

        }

    }
    var stars: some View {
        HStack(spacing: 2.0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
            Text("5")
            Text("Превосходно")
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundStyle(AppColor.orange.color)
        .frame(height: 29)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(AppColor.orangeBackground.color)
        )
    }
    var header: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            PhotoGalleryView()
            VStack(alignment: .leading, spacing: 16.0) {
                stars
                Text("Steigenberger Makadi")
                    .font(.system(size: 22, weight: .medium))
                Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(AppColor.blue.color)
                HStack(alignment: .firstTextBaseline) {
                    Text("от 134 673 ₽")
                        .font(.system(size: 30, weight: .semibold))
                    Text("за тур с перелётом")
                        .foregroundStyle(AppColor.gray.color)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}

struct Tag: Identifiable,Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
