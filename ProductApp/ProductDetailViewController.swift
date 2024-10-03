
import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = product?.title ?? "Product Detail"
        
        setupProductDetails()
    }
    
    private func setupProductDetails() {
        guard let product = product else { return }
        
        let titleLabel = UILabel()
        titleLabel.text = "Title: \(product.title)"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description: \(product.description)"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let priceLabel = UILabel()
        priceLabel.text = "Price: $\(product.price)"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        
        //Add Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
}
