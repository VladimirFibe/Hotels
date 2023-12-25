import SwiftUI

struct HotelView: View {
    var action: Callback?
    @ObservedObject var viewModel: HotelViewModel
    var body: some View {
        if let hotel = viewModel.hotel {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16.0) {
                    HotelHeaderView(hotel: hotel)
                    about
                    button
                }
            }
        } else {
            ProgressView()
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
            TagsView(tags: [
                .init(text: "3-я линия"),
                .init(text: "Платный Wi-Fi в фойе"),
                .init(text: "30 км до аэропорта"),
                .init(text: "1 км до пляжа")])
            Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
                .font(.system(size: 16))
            HotelFeaturesList()

        }
        .padding(.horizontal, 16)
    }
}
//
//struct HotelView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotelView()
//    }
//}

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
    var isInitial = false
}
