import SwiftUI

struct CustomerInfoView: View {
    @State private var phone = ""
    @State private var mail = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.system(size: 22, weight: .medium))
            HotelTextField(placeholder: "Номер телефона", text: $phone)
            HotelTextField(placeholder: "Почта", text: $mail)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .hotelSectionModifier()
    }
}

#Preview {
    CustomerInfoView()
}
