import UIKit

final class HotelViewController: BaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}

extension HotelViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .green
        addNavBarButton(at: .right, with: "Room")
        title = "Отель"
    }

    override func navBarRightButtonHandler() {
        model.pushModuleHandler?()
    }
}
