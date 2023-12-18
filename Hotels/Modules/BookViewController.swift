import UIKit

final class BookViewController: BaseViewController {

}

extension BookViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .green
        addNavBarButton(at: .right, with: "Pay")
        title = "Book"
    }

    override func navBarRightButtonHandler() {
        model.pushModuleHandler?()
    }
}
