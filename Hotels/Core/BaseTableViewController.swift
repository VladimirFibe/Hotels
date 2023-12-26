import UIKit

class BaseTableViewController: UITableViewController, BaseViewControllerProtocol {
    var bag = Bag()

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

    deinit {
        print("\(String(describing: self))ViewController dealloc")
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
