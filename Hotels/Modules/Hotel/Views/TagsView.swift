import SwiftUI

struct TagsView: View {
    var tags: [Tag]
    var body: some View {
        TagLayout {
            ForEach(tags) { tag in
                TagView(text: tag.text)
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
