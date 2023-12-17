import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AnyCoordinator<Void>?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AutomaticCoordinatorConfiguration.enabledDebugLog(true)
        setupAppearance()

        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = SystemNavigationController(hideNavigationBar: false)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        let appCoordinator = CoordinatorFactory.shared.makeApplicationCoordinator(
            router: ApplicationRouter(rootController: rootViewController)
        )

        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }

    func setupAppearance() {

        /// UITabBar & UINavigationBar
    }
}

