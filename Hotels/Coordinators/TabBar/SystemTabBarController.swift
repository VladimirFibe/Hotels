import UIKit

final class SystemTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
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
