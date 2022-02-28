//
//  ProductViewCell.swift
//  BottomSheetExample
//
//  Created by cemal tüysüz on 27.02.2022.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    // Define Views
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel :UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    lazy var productImage:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var addToBasketButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.setTitle("Add To Cart", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7.0
        return stackView
    }()
    
    var product:Product!
    var delegate: ProductCellProtocol?
    
    
    func initialize(product:Product){
        self.product = product
        titleLabel.text = product.productTitle
        priceLabel.text = "\(product.productPrice!) ₺"
        productImage.image = UIImage(named: product.productImageName)
        addToBasketButton.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
        
        containerStackView.addArrangedSubview(productImage)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(priceLabel)
        containerStackView.addArrangedSubview(addToBasketButton)
        containerStackView.frame = contentView.bounds
        
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: containerStackView.frame.width),
            productImage.heightAnchor.constraint(equalToConstant: containerStackView.frame.width)
        ])
        
        contentView.addSubview(containerStackView)
    }
    
    @objc
    func onClick(){
        delegate?.onClick(product: self.product)
    }
    
}

struct Product {
    
    var productImageName:String!
    var productTitle:String!
    var productPrice:CGFloat!
    

    init(productImageName: String? = nil, productTitle: String? = nil, productPrice: CGFloat? = nil) {
       self.productImageName = productImageName
       self.productTitle = productTitle
       self.productPrice = productPrice
   }
}

protocol ProductCellProtocol {
    func onClick(product:Product)
}
