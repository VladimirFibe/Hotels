import SwiftUI

struct DotsView: View {
    @Binding var index: Int
    let count: Int
    var body: some View {
        HStack(spacing: 5.0) {
            ForEach(0..<count, id: \.self) { number in
                Circle()
                    .fill(Color.black)
                    .opacity(dotOpacity(index: index, number: number))
                    .frame(width: 7, height: 7)
                    .onTapGesture {
                        index = number
                    }

            }
        }
        .frame(height: 17)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
            )
    }

    func dotOpacity(index: Int, number: Int) -> Double {
        switch abs(index - number) {
        case 0: return 1
        case 1: return 0.22
        case 2: return 0.17
        case 3: return 0.1
        default: return 0.05
        }
    }
}

struct DotsView_Previews: PreviewProvider {
    static var previews: some View {
        DotsView(index: .constant(3), count: 7)
    }
}
