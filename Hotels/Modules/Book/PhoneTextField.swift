import SwiftUI

struct PhoneTextField: View {
    @Binding var text: String
    var placeholder: String = "+7 (777) 777-77-77"

    var body: some View {

        TextField(placeholder, text: $text)
            .onChange(of: text, { oldValue, newValue in
                text = format(oldValue)
            })
    }
    func format(_ phone: String) -> String {
        let mask = "+X (XXX) XXX-XX-XX"
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}
