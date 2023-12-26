import SwiftUI

struct HotelView: View {
    var action: Callback?
    @ObservedObject var viewModel: HotelViewModel
    var body: some View {
        VStack {
            if let hotel = viewModel.hotel {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 8) {
                        HotelHeaderView(hotel: hotel)
                            .hotelSectionModifier()
                        HotelContentView(hotel: hotel)
                            .hotelSectionModifier()
                    }
                }
            } else {
                ProgressView()
            }
            button
        }
        .background(AppColor.xF6F6F9.color)
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
                .padding(16)
                .background(Color.white)
                .overlay(alignment: .top) {
                    Rectangle()
                        .foregroundStyle(AppColor.xE8E9EC.color)
                        .frame(height: 1)

                }
        }

    }
}

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
    var isInitial = false
}
