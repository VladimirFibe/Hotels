import SwiftUI

struct BookView: View {
    var action: Callback?
    @State var text = "+7"
    @State var tourists: [Tourist] = [.init(id: "Первый турист")]
    @State var firstname = ""
    @State var lastname = ""
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                BookInfoView()
                ForEach($tourists) { $tourist in
                    TouristView(tourist: $tourist)
                }
                add
                BookTotalView()
            }
            button
        }
        .background(AppColor.xF6F6F9.color)
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
        }

    }
    var add: some View {
        HStack {
            Text("Добавить туриста")
                .font(.system(size: 22, weight: .medium))
            Spacer()
            Button(action: addTourist) {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.white)
                    .background(AppColor.blue.color)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
        .hotelSectionModifier()
    }

    func addTourist() {
        let id: String
        switch tourists.count {
        case 1: id = "Второй турист"
        case 2: id = "Третий турист"
        case 3: id = "Четвертый турист"
        case 4: id = "Пятый турист"
        case 5: id = "Шестой турист"
        case 6: id = "Седьмой турист"
        default: id = "\(tourists.count + 1) турист"
        }
        tourists.append(.init(id: id))
    }
}

#Preview {
    BookView()
}
