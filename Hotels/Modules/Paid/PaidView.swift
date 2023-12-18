import SwiftUI

struct PaidView: View {
    var action: Callback?
    var body: some View {
        VStack {
            Spacer()
            Text("🎉")
                .font(.system(size: 47))
                .frame(width: 94, height: 94)
                .background(Color.gray)
                .clipShape(Circle())
            Text("Ваш заказ принят в работу")
                .bold()
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .foregroundStyle(.secondary)
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
                .background(RoundedRectangle(cornerRadius: 15).fill(AppColor.blue.color))
                .padding(.horizontal, 16)
        }

    }
}

#Preview {
    PaidView()
}
