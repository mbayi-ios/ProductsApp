//
//  ProductCell.swift
//  ProductApp
//
//  Created by Ambrose Mbayi on 03/10/2024.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        productImageView.loadImage(from: product.thumbnail, with: activityIndicator)
    }
}
