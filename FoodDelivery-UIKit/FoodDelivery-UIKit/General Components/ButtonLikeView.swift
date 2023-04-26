//
//  ButtonLikeView.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class ButtonLikeView: UIView {
    var action: ()->() = {}
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var parentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, buttonLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        stack.isUserInteractionEnabled = true
        stack.spacing = 12
        stack.alignment = .center
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0)
        return stack
    }()

    init(title: String, image: String, action: @escaping ()->()){
        super.init(frame: .zero)
        self.buttonLabel.text = title
        self.imageView.image = UIImage(named: image)
        self.action = action
        self.addSubview(parentStack)
        setupConstraints()
        let tapRecognizer  = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapRecognizer)
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            default:
                self.layer.borderWidth = 1
                self.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.5).cgColor
                return .clear
            }
        })
    }
    
    @objc func buttonAction(){
        self.action()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        let views = ["imageView": imageView, "parentStack": parentStack]
        NSLayoutConstraint.activate([NSLayoutConstraint.constraints(withVisualFormat: "H:[imageView(25)]", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:[imageView(25)]", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:|[parentStack]|", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "H:|[parentStack]|", metrics: nil, views: views)].flatMap({$0}))
    }
    
}
