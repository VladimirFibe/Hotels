import SwiftUI

struct TagsView: View {
    private var tags: [Tag] = [
        .init(text: "3-я линия"),
        .init(text: "Платный Wi-Fi в фойе"),
        .init(text: "30 км до аэропорта"),
        .init(text: "1 км до пляжа")]
    @State var line = 0
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

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView()
    }
}
