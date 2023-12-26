import SwiftUI
import Kingfisher
struct PhotoGalleryView: View {
    @State private var selection = 0
    let imageUrls: [String]
    var body: some View {
        TabView(selection: $selection) {
            ForEach(imageUrls.indices, id: \.self) { index in
                KFImage(URL(string: imageUrls[index])!)
                    .placeholder({ _ in Image("photoPlaceholder") })
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 257)
                    .clipShape(.rect(cornerRadius: 15))
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 257)
        .overlay(
            DotsView(index: $selection, count: imageUrls.count)
                .padding(.bottom, 8)
            , alignment: .bottom
        )
    }
}

struct PhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGalleryView(imageUrls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"])
    }
}
