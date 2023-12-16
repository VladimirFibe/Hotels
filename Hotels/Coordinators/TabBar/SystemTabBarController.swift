import UIKit

final class SystemTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        definesPresentationContext = true

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .customMint

            tabBarItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            tabBarItemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.clear]

            appearance.stackedLayoutAppearance = tabBarItemAppearance
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
