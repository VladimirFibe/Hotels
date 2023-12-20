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
        setupAppearance()
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

    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]

        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().tintColor = UIColor.label
        appearance.buttonAppearance = buttonAppearance

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

