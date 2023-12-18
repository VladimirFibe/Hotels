import UIKit

final class RoomViewController: BaseViewController {

}

extension RoomViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .green
        addNavBarButton(at: .right, with: "Book")
        title = "Room"
    }

    override func navBarRightButtonHandler() {
        model.pushModuleHandler?()
    }
}
