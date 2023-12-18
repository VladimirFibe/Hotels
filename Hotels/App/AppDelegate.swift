import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hotelController: HotelViewController?
    var roomController: RoomViewController?
    var bookController: BookViewController?
    var paidController: PaidViewController?

    var appCoordinator: AnyCoordinator<Void>? = nil
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        hotelController = HotelViewController(model: .init(pushModuleHandler: { [weak self] in
            self?.startRoom()
        }
        ))
        if let hotelController {
            let rootViewController = UINavigationController(rootViewController: hotelController)
            window?.rootViewController = rootViewController
        }
        window?.makeKeyAndVisible()

        return true
    }

    func startRoom() {
        roomController = RoomViewController(model: .init(pushModuleHandler: { [weak self] in
            self?.startBook()

        }))
        
        if let roomController {
            self.hotelController?.navigationController?.pushViewController(roomController, animated: true)
        }
    }

    func startBook() {
        bookController = BookViewController(model: .init(pushModuleHandler: { [weak self] in
            self?.startPaid()
        }))

        if let bookController {
            self.roomController?.navigationController?.pushViewController(bookController, animated: true)
        }
    }

    func startPaid() {
        paidController = PaidViewController(model: .init(popToRootHandler: { [weak self] in
            self?.paidController?.navigationController?.popToRootViewController(animated: true)
        }))
        if let paidController {
            self.bookController?.navigationController?.pushViewController(paidController, animated: true)
        }
    }

    func setupAppearance() {

        /// UITabBar & UINavigationBar
    }

    func start() {
        let rootViewController = SystemNavigationController(hideNavigationBar: true)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        AutomaticCoordinatorConfiguration.enabledDebugLog(true)
        let appCoordinator = CoordinatorFactory.shared.makeApplicationCoordinator(
            router: ApplicationRouter(rootController: rootViewController)
        )

        appCoordinator.start()
        self.appCoordinator = appCoordinator
    }
}

