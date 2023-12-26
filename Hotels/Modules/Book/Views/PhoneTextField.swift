import SwiftUI

struct PhoneTextField: View {
    var placeholder: String = "Номер телефона"
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !text.isEmpty {
                Text(placeholder)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            TextField("+7 (951) 555-99-00", text: $text)
                .font(.system(size: text.isEmpty ? 16 : 17))
                .keyboardType(.phonePad)
                .onChange(of: text, { oldValue, newValue in
                    text = format(oldValue)
                })
        }
        .padding(.horizontal)
        .frame(height: 52)
        .background(AppColor.xF6F6F9.color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    func format(_ phone: String) -> String {
        let mask = "+X (XXX) XXX-XX-XX"
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)

            } else {
                result.append(ch)
            }
        }
        return result
    }
}
