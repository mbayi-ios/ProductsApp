import Foundation
import UIKit

class ProductCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productListVC = ProductListViewController()
        productListVC.coordinator = self
        navigationController.pushViewController(productListVC, animated: true)
    }
    
    func showProductDetail(for product: Product) {
        let productDetailVC = ProductDetailViewController()
        productDetailVC.product = product
        navigationController.pushViewController(productDetailVC, animated: true)
    }
}
