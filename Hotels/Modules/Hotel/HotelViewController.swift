import SwiftUI

final class HotelViewController: BaseViewController {
    lazy var content = UIHostingController(
        rootView: HotelView(action: { [weak self] in
            self?.pushModule()
        }))
}

extension HotelViewController {
    override func setupViews() {
        super.setupViews()
        addIgnoringSafeArea(content)
        navigationItem.title = "Отель"
    }

    func pushModule() {
        model.pushModuleHandler?()
    }
}
