import UIKit

final class PaidViewController: BaseViewController {

}

extension PaidViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .green
        addNavBarButton(at: .right, with: "Root")
        title = "Paid"
    }

    override func navBarRightButtonHandler() {
        model.popToRootHandler?()
    }
}
