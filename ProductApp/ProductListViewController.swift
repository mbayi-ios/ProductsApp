//
//  ProductListViewController.swift
//  ProductApp
//
//  Created by Ambrose Mbayi on 03/10/2024.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private var products: [Product] = []
    var coordinator: ProductCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products"
        view.backgroundColor = .white
        setupTableView()
        fetchProducts()
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        view.addSubview(tableView)
        
        tableView.rowHeight = 80
    }
    
    private func fetchProducts() {
        let apiService = ApiService()
        apiService.fetchProducts { [weak self] products in
            DispatchQueue.main.async {
                self?.products = products
                self?.tableView.reloadData()
            }
        }
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("hello \(product.title)")
        coordinator?.showProductDetail(for: product)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


extension UIImageView {
    func loadImage(from urlString: String, with loader: UIActivityIndicatorView) {
        loader.startAnimating()
        self.image = nil
        
        guard let url = URL(string: urlString) else {
            loader.stopAnimating()
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                    loader.stopAnimating()
                }
            } else {
                DispatchQueue.main.async {
                    loader.stopAnimating()
                }
            }
        }.resume()
    }
}
