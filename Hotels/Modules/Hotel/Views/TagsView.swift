import SwiftUI

struct TagsView: View {
    private var tags: [Tag] = [
        .init(text: "3-я линия"),
        .init(text: "Платный Wi-Fi в фойе"),
        .init(text: "30 км до аэропорта"),
        .init(text: "1 км до пляжа")]
    @State var line = 0
    var body: some View {
        VStack(alignment: .leading) {
            generateContent(size: UIScreen.main.bounds.size.width - 24)
        }
    }

    private func generateContent(size: CGFloat) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(tags) { tag in
                TagView(text: tag.text)
                    .padding(4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > size {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == tags.first! {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == tags.first! {
                            height = 0
                        }
                        return result
                    })
            }
        }
    }
}

struct TagView: View  {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(AppColor.gray.color)
            .lineLimit(1)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(AppColor.lightGray.color)
            )
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView()
    }
}
