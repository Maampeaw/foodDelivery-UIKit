//
//  BottomMenuBar.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit


enum MenuSections: Int{
    case home
    case profile
    case cart
    case chat
}

class BottomMenuBar: UIView {
    weak var delegate: MenuActionDelegate?
    
    let homeImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "home")
            return imageView
    }()
    
    let profileIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    let cartIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cart")
        return imageView
    }()
    
    let chatIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "chat")
        return imageView
    }()
    let homeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home"
        return label
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "profile"
        return label
    }()
    
    let cartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cart"
        return label
    }()
    
    let chatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chat"
        return label
    }()
    
    lazy var homeHorizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [homeImage])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = true
        stackView.tag = 0
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(homeDelegateAction))
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    lazy var profileHorizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileIconImage])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.tag = 1
        stackView.isUserInteractionEnabled = true
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileDelegateAction))
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    lazy var cartHorizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cartIconImage])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = true
        stackView.tag = 2
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cartDelegateAction))
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    lazy var chatHorizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chatIconImage])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = true
        stackView.tag = 3
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chatDelegateAction))
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    lazy var parentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [homeHorizontalStack, profileHorizontalStack, cartHorizontalStack, chatHorizontalStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(parentStack)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 22
        backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle{
            case .light:
                return .white
            case .dark:
                return Colors.menuButtonColor
            default:
                return .white
            }
        })
    }
    
    @objc func homeDelegateAction(){
        delegate?.menuOnTap(menuSection: .home)
    }
    @objc func profileDelegateAction(){
        delegate?.menuOnTap(menuSection: .profile)
    }
    
    @objc func cartDelegateAction(){
        delegate?.menuOnTap(menuSection: .cart)
    }
    
    @objc func chatDelegateAction(){
        delegate?.menuOnTap(menuSection: .chat)
    }
    func setupConstraints(){
        let views = ["parentStack":parentStack]
        [homeImage, profileIconImage, cartIconImage, chatIconImage].forEach { imageView in
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        }
        let stackConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[parentStack]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[parentStack]|", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(stackConstraints)
    }
    
    func toggleSelectedCart(with state: MenuSections){
        switch state{
        case .home:
            expandtabAction(with: homeHorizontalStack, label: homeLabel, value: true)
            expandtabAction(with: profileHorizontalStack, label: profileLabel, value: false)
            expandtabAction(with: chatHorizontalStack, label: chatLabel, value: false)
            expandtabAction(with: cartHorizontalStack, label: cartLabel, value: false)
        case .profile:
            expandtabAction(with: homeHorizontalStack, label: homeLabel, value: false)
            expandtabAction(with: profileHorizontalStack, label: profileLabel, value: true)
            expandtabAction(with: chatHorizontalStack, label: chatLabel, value: false)
            expandtabAction(with: cartHorizontalStack, label: cartLabel, value: false)
        case .cart:
            expandtabAction(with: homeHorizontalStack, label: homeLabel, value: false)
            expandtabAction(with: profileHorizontalStack, label: profileLabel, value: false)
            expandtabAction(with: chatHorizontalStack, label: chatLabel, value: false)
            expandtabAction(with: cartHorizontalStack, label: cartLabel, value: true)
        case .chat:
            expandtabAction(with: homeHorizontalStack, label: homeLabel, value: false)
            expandtabAction(with: profileHorizontalStack, label: profileLabel, value: false)
            expandtabAction(with: chatHorizontalStack, label: chatLabel, value: true)
            expandtabAction(with: cartHorizontalStack, label: cartLabel, value: false)
        }
    }
    
    func expandtabAction(with stack: UIStackView, label: UILabel, value: Bool){
        if value{
            stack.addArrangedSubview(label)
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
                stack.backgroundColor = UIColor(dynamicProvider: { trait in
                    switch trait.userInterfaceStyle{
                    case .light:
                        return UIColor(red: 236/255, green: 249/255, blue: 243/255, alpha: 1)
                    case .dark:
                        return UIColor(red: 103/255, green: 205/255, blue: 135/255, alpha: 0.7)
                    default:
                        return UIColor(red: 236/255, green: 249/255, blue: 243/255, alpha: 1)
                    }
                })
            }
        }else{
            stack.backgroundColor = .clear
            stack.removeArrangedSubview(label)
            label.alpha = 0
            UIView.animate(withDuration: 0.2) {
                
                self.layoutIfNeeded()
            }completion: { completed in
               label.removeFromSuperview()
               label.alpha = 1
            }
        }
    }

}




protocol MenuActionDelegate: AnyObject{
    func menuOnTap(menuSection: MenuSections)
}


