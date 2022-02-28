//
//  ProductVC.swift
//  BottomSheetExample
//
//  Created by cemal tüysüz on 28.02.2022.
//

import UIKit

class ProductVC: BottomSheetVC<Product> {
    
    // Views
    
    lazy var productImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        img.image = UIImage(named: data?.productImageName ?? "iphone11")
        return img
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = data?.productTitle ?? ""
        return label
    }()
    
    lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "\(data?.productPrice ?? 0) ₺" 
        label.textColor = .blue
        return label
    }()
    
    lazy var VStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,priceLabel,buyButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buyButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add To Cart", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.backgroundColor = .black
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
    }
    
    
    
    func configureUI() {
        self.view.backgroundColor = .clear
    }
    
    func configureConstraints(){
        container.addSubview(productImage)
        container.addSubview(VStackView)
        
        NSLayoutConstraint.activate([
            // Product imageView constraints
            productImage.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            productImage.heightAnchor.constraint(equalToConstant: view.frame.width / 3),
            productImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            productImage.topAnchor.constraint(equalTo: container.topAnchor,constant: 30),
            
            VStackView.topAnchor.constraint(equalTo: productImage.bottomAnchor,constant: 20),
            VStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            VStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30),
            VStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -30),
            
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
