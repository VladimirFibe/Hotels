import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startAppCoordinator()
        return true
    }

    private func startAppCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let router = RouterImpl(rootController: navigationController)
        let appCoordinator = AppCoordinator(router: router)
        self.appCoordinator = appCoordinator

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        appCoordinator.start()
    }
}

