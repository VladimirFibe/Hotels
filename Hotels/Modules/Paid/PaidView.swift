import SwiftUI

struct PaidView: View {
    var action: Callback?
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("🎉")
                .font(.system(size: 47))
                .frame(width: 94, height: 94)
                .background(AppColor.xF6F6F9.color)
                .clipShape(Circle())
                .padding(.bottom, 12)
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22, weight: .medium))
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .padding(.horizontal, 20)
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
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(AppColor.blue.color)
                )
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    PaidView()
}
