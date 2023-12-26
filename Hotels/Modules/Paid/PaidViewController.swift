import SwiftUI

final class PaidViewController: BaseViewController {
    struct Model {
        var pushUnitHandler: Callback? = nil
        var pushModuleHandler: Callback? = nil
        var closeUnitOrModuleHandler: Callback? = nil
        var popToRootHandler: Callback? = nil
        var modalModuleHandler: Callback? = nil
        var modalUnitHandler: Callback? = nil
        var closeModalHandler: Callback? = nil
    }

    let model: Model
    lazy var content = UIHostingController(
        rootView: PaidView(action: { [weak self] in
            self?.popToRootHandler()
        }))

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
