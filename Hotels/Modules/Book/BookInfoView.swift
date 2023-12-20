import SwiftUI

struct BookInfoView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            BookInfoRow(title: "Вылет из", value: "Санк-Петербург")
            BookInfoRow(title: "Страна, город", value: "Египет, Хургада")
            BookInfoRow(title: "Даты", value: "19.09.2023 – 27.09.2023")
            BookInfoRow(title: "Кол-во ночей", value: "7 ночей")
            BookInfoRow(title: "Отель", value: "Steigenberger Makadi")
            BookInfoRow(title: "Номер", value: "Стандартный с видом на бассейн или сад")
            BookInfoRow(title: "Питание", value: "Все включено")
        }
        .hotelSectionModifier()
    }
}

struct BookInfoRow: View {
    let title: String
    let value: String
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .frame(width: 150, alignment: .leading)
                .foregroundStyle(.secondary)
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    BookInfoView()
        .padding(.horizontal)

}
