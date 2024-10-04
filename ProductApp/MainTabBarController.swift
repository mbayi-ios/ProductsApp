import UIKit
import Foundation

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productListVC = ProductListViewController()
        productListVC.title = "Products"
        let productListNavController = UINavigationController(rootViewController: productListVC)
        productListNavController.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        viewControllers = [productListNavController]
    }
}
