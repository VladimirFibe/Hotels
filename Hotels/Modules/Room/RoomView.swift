import SwiftUI

struct RoomView: View {
    var action: Callback?
    var body: some View {
        VStack {
            PhotoGalleryView()
            Text("Стандартный с видном на бассейн или сад")
                .font(.system(size: 22, weight: .medium))
            HStack {
                Text("Подробнее о номере")
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(AppColor.blue.color)
            .padding(.horizontal, 10)
            .frame(height: 29)
            .background(AppColor.blue.color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(maxWidth: .infinity, alignment: .leading)

            button
        }
        .hotelSectionModifier()
    }
    var button: some View {
        Button {
            action?()
        } label: {
            Text("Выбрать номер")
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 15).fill(AppColor.blue.color))
        }

    }
}

#Preview {
    RoomView()
}
