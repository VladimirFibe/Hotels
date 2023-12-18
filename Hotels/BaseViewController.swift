import UIKit

typealias CallBack = () -> Void
class BaseViewController: UIViewController {
    struct Model {
        var pushUnitHandler: CallBack? = nil
        var pushModuleHandler: CallBack? = nil
        var closeUnitOrModuleHandler: CallBack? = nil
        var popToRootHandler: CallBack? = nil
        var modalModuleHandler: CallBack? = nil
        var modalUnitHandler: CallBack? = nil
        var closeModalHandler: CallBack? = nil
    }

    let model: Model

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("\(title ?? "")ViewController dealloc")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
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
