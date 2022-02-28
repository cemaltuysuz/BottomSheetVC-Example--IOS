//
//  BottomSheetVC.swift
//  BottomSheetExample
//
//  Created by cemal tüysüz on 28.02.2022.
//

import UIKit

class BottomSheetVC: UIViewController {
    
    // last layer (BottomSheet)
    lazy var container : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    // second layer
    lazy var curtain: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = curtainAlpha
        return view
    }()
    
    var curtainAlpha:CGFloat = 0.6
    var defaultHeight:CGFloat = 300
    
    // Constraints
    var containerViewHeightConstraint:NSLayoutConstraint?
    var containerViewBottomConstraint:NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateConstraints()
        setupUI()
        setupConstraints()

    }
    
    func calculateConstraints(){
        // Ekran boyutunun %40 lık uzunkuğunu default olarak ayarladım.
        self.defaultHeight = view.frame.height * (2/5)
    }
    
    func setupUI(){
        view.backgroundColor = .clear
    }
    
    func setupConstraints(){
        view.addSubview(curtain)
        view.addSubview(container)
        curtain.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Set Curtain's Constraints
            curtain.topAnchor.constraint(equalTo: view.topAnchor),
            curtain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            curtain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            curtain.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            // Set container's constraints with dynamicly (only left and rigth)
            container.leadingAnchor.constraint(equalTo: curtain.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: curtain.trailingAnchor)
        ])
        
        // Set Constraint default height
        containerViewHeightConstraint =  container.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint =  container.bottomAnchor.constraint(equalTo: curtain.bottomAnchor, constant: 0)
        
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        print(self.view.subviews.count)
    }
    
}
