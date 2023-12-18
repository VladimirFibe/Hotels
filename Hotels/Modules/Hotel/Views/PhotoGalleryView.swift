import SwiftUI

struct PhotoGalleryView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0..<7) { index in
                Image("\(index)")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 257)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 257)
        .overlay(
            DotsView(index: $selection, count: 7)
                .padding(.bottom, 8)
            , alignment: .bottom
        )
    }
}

struct PhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGalleryView()
    }
}
