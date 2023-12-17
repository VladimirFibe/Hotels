import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    deinit {
        print("\(title ?? "") dealloc")
    }
}

@objc extension BaseViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
    }
    func setupConstraints() {}
    func navBarLeftButtonHandler() {}
    func navBarRightButtonHandler() {}
}

extension BaseViewController {
    func addNavBarButton(
        at position: NavBarPosition,
        with title: String? = nil,
        image: UIImage? = nil
    ) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: [])
        button.setImage(image, for: [])
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .primaryActionTriggered)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .primaryActionTriggered)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

enum NavBarPosition {
    case left
    case right
}
