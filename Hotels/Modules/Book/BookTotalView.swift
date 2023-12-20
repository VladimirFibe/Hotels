import SwiftUI

struct BookTotalView: View {
    let tur = 186600
    let power = 9300
    let service = 2136
    var total: Int {
        tur + power + service
    }
    var body: some View {
        VStack(spacing: 16.0) {
            BookTotalRow(title: "Тур", value: tur)
            BookTotalRow(title: "Топливный сбор", value: power)
            BookTotalRow(title: "Сервисный сбор", value: service)
            BookTotalRow(title: "К оплате", value: total, isTotal: true)
        }
        .hotelSectionModifier()
    }
}

struct BookTotalRow: View {
    var title: String
    var value: Int
    var isTotal = false
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text("\(value) ₽")
                .fontWeight(isTotal ? .semibold : .regular)
                .foregroundStyle(isTotal ? AppColor.blue.color : .primary)
        }
        .font(.system(size: 16))
    }
}

#Preview {
    BookTotalView()
        .padding()
}
