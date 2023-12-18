import SwiftUI

struct PaidView: View {
    var action: Callback?
    var body: some View {
        VStack {
            Spacer()
            button
        }
    }
    var button: some View {
        Button {
            action?()
        } label: {
            Text("Супер!")
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
    PaidView()
}
