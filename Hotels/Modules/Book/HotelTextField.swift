import SwiftUI

struct HotelTextField: View {
    var placeholder: String = "Имя"
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !text.isEmpty {
                Text(placeholder)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            TextField(placeholder, text: $text)
                .font(.system(size: text.isEmpty ? 16 : 17))
        }
        .padding(.horizontal)
        .frame(height: 52)
        .background(AppColor.xF6F6F9.color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
