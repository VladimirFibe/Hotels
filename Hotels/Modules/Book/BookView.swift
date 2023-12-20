import SwiftUI

struct BookView: View {
    var action: Callback?
    @State var text = "+7"
    var body: some View {
        VStack {
            BookInfoView()
            PhoneTextField(text: $text)
            Spacer()
            button
        }
        .padding()
    }
    var button: some View {
        Button {
            action?()
        } label: {
            Text("Оплатить")
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
    BookView()
}
