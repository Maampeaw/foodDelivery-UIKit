//
//  LogoView.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class LogoView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "foodNinjaLogo")
        return imageView
    }()

    let logoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.text = Strings.foodNinja
        label.textColor = Colors.customGreen
        return label
    }()
    
    let logoSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.logoSubtitle
        label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return label
    }()
    
    lazy var parentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImageView, logoTitle, logoSubtitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(parentStack)
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["logoImage": logoImageView, "parentStack": parentStack]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[parentStack]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[parentStack]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:[logoImage(175)]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[logoImage(139)]", metrics: nil, views: views)].flatMap({$0}))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
