import UIKit
import Foundation

class MainTabBarController: UITabBarController {
    var productCoordinator: ProductCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        setupViewControllers()
        
    }
    
    private func setupTabBarAppearance() {
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(hex: "#00958F")
        tabBar.unselectedItemTintColor = UIColor.black
        
       // tabBar.isTranslucent = false
    }
    
    private func setupViewControllers() {
        let navigationController = UINavigationController()
        
        productCoordinator = ProductCoordinator(navigationController: navigationController)
        productCoordinator?.start()
        
        let productListNavController = navigationController
        productListNavController.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        let signInVC = SignInViewController()
        let signInNavController = UINavigationController(rootViewController: signInVC)
        signInNavController.tabBarItem = UITabBarItem(title: "Sign In", image: UIImage(systemName: "person.circle"), tag: 1)
        
        viewControllers = [productListNavController, signInNavController]
    }
}
