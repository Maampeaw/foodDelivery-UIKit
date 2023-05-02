//
//  PopularMenuTableViewCell.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 5/2/23.
//

import UIKit

class PopularMenuTableViewCell: UITableViewCell {
    static let identifire: String = "popularMenu"
    let imageContainer: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 16
        return view
    }()
    
    let  titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceAndSubtitleStack: UIStackView = {
        let stack  = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var imageAndPriceSubtitleLabel: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageContainer, priceAndSubtitleStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    lazy var parentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageAndPriceSubtitleLabel, priceLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.backgroundColor = .red
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 16
       stackView.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            default:
                return .white
            }
        })
        return stackView
    }()
    
   
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(parentStack)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 31, bottom: 10, trailing: 31)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        setupConstraints()
        
    }
    
    func render(with value: Option){
        imageContainer.image = UIImage(named: value.imageName)
        titleLabel.text = value.title
        subtitleLabel.text = value.title
        priceLabel.text = value.cost
        
    }
    
    func setupConstraints(){
        let views = ["parentStack": parentStack]
        let parentStackConstraints = [NSLayoutConstraint.constraints(withVisualFormat: "H:|-[parentStack]-|", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:|-[parentStack]-|", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(parentStackConstraints)
        let imageConstraints = [imageContainer.heightAnchor.constraint(equalToConstant: 64), imageContainer.widthAnchor.constraint(equalToConstant: 64)]
        NSLayoutConstraint.activate(imageConstraints)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
