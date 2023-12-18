import SwiftUI

final class BookViewController: BaseViewController {
    lazy var content = UIHostingController(
        rootView: BookView(action: { [weak self] in
            self?.pushModule()
        }))
}

extension BookViewController {
    override func setupViews() {
        super.setupViews()
        addIgnoringSafeArea(content)
        addNavBarButton(at: .left, image: UIImage(systemName: "chevron.left"))
        navigationItem.title = "Бронирование"
    }

    func pushModule() {
        model.pushModuleHandler?()
    }

    override func navBarLeftButtonHandler() {
        model.closeUnitOrModuleHandler?()
    }
}
