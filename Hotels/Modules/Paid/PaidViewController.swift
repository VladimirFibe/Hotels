import SwiftUI

final class PaidViewController: BaseViewController {
    lazy var content = UIHostingController(
        rootView: PaidView(action: { [weak self] in
            self?.popToRootHandler()
        }))
}

extension PaidViewController {
    override func setupViews() {
        super.setupViews()
        addIgnoringSafeArea(content)
        addNavBarButton(at: .left, image: UIImage(systemName: "chevron.left"))
        navigationItem.title = "Заказ оплачен"
    }

    func popToRootHandler() {
        model.popToRootHandler?()
    }

    override func navBarLeftButtonHandler() {
        model.closeUnitOrModuleHandler?()
    }
}
