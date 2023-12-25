import SwiftUI

struct TouristView: View {
    @Binding var tourist: Tourist
    @State private var show = true
    var body: some View {
        VStack {
            HStack {
                Text(tourist.id)
                    .font(.system(size: 22, weight: .medium))
                Spacer()
                Button(action: {
                    withAnimation { show.toggle() }
                }) {
                    Image(systemName: show ? "chevron.up" : "chevron.down")
                        .fontWeight(.semibold)
                        .frame(width: 32, height: 32)
                        .foregroundColor(AppColor.blue.color)
                        .background(AppColor.blue.color.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
            if show {
                VStack {
                    HotelTextField(placeholder: "Имя", text: $tourist.firstname)
                    HotelTextField(placeholder: "Фамилия", text: $tourist.lastname)
                    HotelTextField(placeholder: "Дата рождения", text: $tourist.birthday)
                    HotelTextField(placeholder: "Гражданство", text: $tourist.citizen)
                    HotelTextField(placeholder: "Номер азранпаспорта", text: $tourist.passport)
                    HotelTextField(placeholder: "Срок действия заграпаспорта", text: $tourist.validDate)
                }
            }
        }
        .padding(16)
        .hotelSectionModifier()
    }
}

struct HotelSectionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

extension View {
    func hotelSectionModifier() -> some View {
        self
            .modifier(HotelSectionModifier())
    }
}
