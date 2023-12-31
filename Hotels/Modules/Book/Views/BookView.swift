import SwiftUI

struct BookView: View {
    var action: Callback?
    @ObservedObject var viewModel: BookViewModel
    @State var tourists: [Tourist] = [.init(id: "Первый турист")]
    var info: some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.system(size: 22, weight: .medium))
            PhoneTextField(placeholder: "Номер телефона", text: $viewModel.phone)
            HotelTextField(placeholder: "Почта", text: $viewModel.mail)
                .keyboardType(.emailAddress)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .hotelSectionModifier()
    }
    var body: some View {
        VStack {
            if let book = viewModel.book {
                ScrollView(.vertical, showsIndicators: false) {
                    BookHeaderView(book: book)
                    .hotelSectionModifier()
                    BookInfoView(book: book)
                    info
                    ForEach($tourists) { $tourist in
                        TouristView(tourist: $tourist)
                    }
                    add
                    BookTotalView(book: book)
                }
            } else {
                ProgressView()
            }
            button
        }
        .background(AppColor.xF6F6F9.color)
    }
    var button: some View {
        Button {
            print(viewModel.isValidEmail)
            if viewModel.isValidEmail {
                action?()
            }
        } label: {
            Text(viewModel.title)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 15).fill(AppColor.blue.color))
                .padding(16)
                .background(Color.white)
                .overlay(alignment: .top) {
                    Rectangle()
                        .foregroundStyle(AppColor.xE8E9EC.color)
                        .frame(height: 1)

                }
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
            .disabled(!(tourists.last?.validFields ?? false))
        }
        .padding(16)
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
    BookView(viewModel: BookViewModel())
}
