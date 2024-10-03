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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
        view.addSubview(tableView)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        coordinator?.showProductDetail(for: product)
    }
}
