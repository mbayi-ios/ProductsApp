
import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    var product: Product?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = product?.title ?? "Product Detail"
        
        setupViews()
        setupProductDetails()
    }
    
    private func setupViews() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(productImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            activityIndicator.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor)
        ])
    }
    
    private func setupProductDetails() {
        guard let product = product else { return }
        
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "Price: $\(product.price)"
        
        if let firstImage = product.images.first {
            productImageView.loadImage(from: firstImage, with: activityIndicator)
        }
        
        
    }
}
