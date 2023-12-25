import SwiftUI

struct RoomView: View {
    var action: Callback?
    let room: Room
    var tags: [Tag] {
        room.peculiarities.map { Tag(text: $0)}
    }
    var body: some View {
        VStack {
            PhotoGalleryView(imageUrls: room.imageUrls)
            VStack {
                Text(room.name)
                    .font(.system(size: 22, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TagsView(tags: tags)
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
                HStack(alignment: .firstTextBaseline) {
                    Text("\(room.price) ₽")
                        .font(.system(size: 30, weight: .semibold))
                    Text(room.pricePer)
                        .foregroundStyle(AppColor.gray.color)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                button
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 16)
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
    VStack {
        RoomView(room: Room.example)
        Spacer()
    }
}
