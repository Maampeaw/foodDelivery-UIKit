//
//  RestaurantCollectionViewCell.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 5/1/23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "RestaurantCollectionViewCell"
    
    let imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let preparationTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var parentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainer, titleLabel,preparationTime])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 26, leading: 0, bottom: 26, trailing: 0)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 16
        contentView.addSubview(parentStack)
        contentView.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            default:
                return .white
            }
        })
        
        setupConstraints()
    }
    
    func setupConstraints(){
        let parentStackConstraints = [parentStack.leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor), parentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), parentStack.topAnchor.constraint(equalTo: contentView.topAnchor), parentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        NSLayoutConstraint.activate(parentStackConstraints)
        
        let imageConstraints = [imageContainer.heightAnchor.constraint(equalToConstant: 73), imageContainer.widthAnchor.constraint(equalToConstant: 96)]
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(with value: Option){
        imageContainer.image = UIImage(named: value.imageName)
        titleLabel.text = value.title
        preparationTime.text = value.preparationTime
    }
    
    
}
