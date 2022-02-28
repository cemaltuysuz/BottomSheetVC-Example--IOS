//
//  ViewController.swift
//  BottomSheetExample
//
//  Created by cemal tüysüz on 27.02.2022.
//

import UIKit

class ViewController: UIViewController {
        
    var productCollectionView:UICollectionView!
    
    
    var collectionViewMargin:CGFloat = 20
    var itemCountInLine:Int = 2
    var spaceBetweenItems:CGFloat = 30
    var spaceBetweenRows:CGFloat = 20
    var cellHeightRatio:CGFloat = 1.80
    
    var products:[Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTheList()
        setupUI()
    }
    
    
    func setupUI(){
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = spaceBetweenItems
        layout.minimumLineSpacing = spaceBetweenRows
        
        productCollectionView = UICollectionView(frame: self.view.frame,
                                                 collectionViewLayout: layout)
        productCollectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: "cell")
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        view.addSubview(productCollectionView)
    }
    
    func fillTheList(){
        products = [Product]()
        products.append(Product(productImageName: "iphone11", productTitle: "Iphone 11", productPrice: 7000))
        products.append(Product(productImageName: "macbookPro", productTitle: "Macbook Pro", productPrice: 14000))
        products.append(Product(productImageName: "airpods", productTitle: "Airpods", productPrice: 800))
        products.append(Product(productImageName: "airpods-max", productTitle: "Airpods - Max", productPrice: 1000))
        
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let current = products![indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductViewCell
        cell.delegate = self
        cell.initialize(product: current)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width - (2 * collectionViewMargin)
        let cellWidth = (collectionWidth - ( CGFloat(itemCountInLine - 1) * spaceBetweenItems)) / CGFloat(itemCountInLine)
        
        return CGSize(width: cellWidth, height: cellWidth * cellHeightRatio)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: collectionViewMargin,
                            left: collectionViewMargin,
                            bottom: collectionViewMargin,
                            right: collectionViewMargin)
    }
    
}
// Sepete ekle
extension ViewController : ProductCellProtocol {
    func onClick(product: Product) {
        print("Product name : \(product.productTitle!) | prodduct price : \(product.productPrice!)")
    }
}

