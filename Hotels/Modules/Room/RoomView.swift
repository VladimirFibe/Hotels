import SwiftUI

struct RoomView: View {
    var action: Callback?
    var body: some View {
        VStack {
            PhotoGalleryView()
            button
        }
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
                .padding(.horizontal, 16)
        }

    }
}

#Preview {
    RoomView()
}
