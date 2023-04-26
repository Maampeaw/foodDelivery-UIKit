//
//  SignInVC.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class SignInVC: BottomButtonVC {
    
    let patternImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "appPattern")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoView: LogoView = {
        let view = LogoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = Strings.loginTitle
        label.textAlignment = .center
        return label
    }()
    
    let emailTextfield: MyCustomTextField = {
        let textField = MyCustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        return textField
    }()
    
    let passwordTextfield: MyCustomTextField = {
        let textField = MyCustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        return textField
    }()
    
    let continueWithLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.text = Strings.continueWith
        return label
    }()
    
    lazy var facebookButton: ButtonLikeView = {
        let view = ButtonLikeView(title: "Facebook", image: "fb") {
            print("Action Here")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var googleButton: ButtonLikeView = {
        let view = ButtonLikeView(title: "Google", image: "ggl") {
            self.view.endEditing(true)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.forgotPassword
        label.textAlignment = .center
        label.textColor = Colors.customGreen
        return label
    }()
    
    lazy var textFieldStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, continueWithLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 12
        return stack
    }()
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [facebookButton, googleButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = true
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubviews(patternImage, scrollView, loginLabel)
        scrollView.addSubviews(logoView, textFieldStack, facebookButton, googleButton, forgotPasswordLabel)
        self.view.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle{
            case .light:
                return .white
            case .dark:
                return .black
            default:
                return .white
            }
        })
        setupConstraints()
       
    }
    
    //clean this function up later
    func setupConstraints(){
        let views = ["patternImage": patternImage, "scrollView": scrollView, "bottomButton": bottomButton, "loginLabel": loginLabel, "logoView": logoView, "textFieldStack": textFieldStack, "forgotPassword": forgotPasswordLabel, "facebook": facebookButton]
        let logoViewConstraints = [logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor), logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30)]
        let googleButtonConstraints = [facebookButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25), facebookButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 12), forgotPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
        NSLayoutConstraint.activate(googleButtonConstraints)
        googleButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/2).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 70)/2).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
        NSLayoutConstraint.activate([logoViewConstraints,
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[patternImage]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[patternImage]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollView]-[bottomButton]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[logoView]-50-[loginLabel]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[loginLabel]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[loginLabel]-30-[textFieldStack]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[facebook]-12-[forgotPassword]", metrics: nil, views: views),
        [textFieldStack.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor), textFieldStack.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor), googleButton.leadingAnchor.constraint(equalTo: facebookButton.trailingAnchor, constant: 12), googleButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 12)]].flatMap({$0}))
    }
    
    override var buttonTitle: String{
        return "Login"
    }
    
    override var verticalInset: CGFloat{
        return 18
    }
    
    override var horizontalInset: CGFloat{
        return 49
    }
    
    override func buttonAction() {
        print("this is what will be called")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    
}
