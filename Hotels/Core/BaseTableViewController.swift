import UIKit

class BaseTableViewController: UITableViewController, BaseViewControllerProtocol {
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

    public var onRemoveFromNavigationStack: (() -> Void)?
    public var onDidDismiss: (() -> Void)?

    override public func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if parent == nil {
            onRemoveFromNavigationStack?()
        }
    }

    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag) { [weak self] in
            completion?()
            self?.onDidDismiss?()
        }
    }

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("\(String(describing: self))ViewController dealloc")
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

@objc extension BaseTableViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
    }
    func setupConstraints() {}
    func navBarLeftButtonHandler() {}
    func navBarRightButtonHandler() {}
}

extension BaseTableViewController {
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
