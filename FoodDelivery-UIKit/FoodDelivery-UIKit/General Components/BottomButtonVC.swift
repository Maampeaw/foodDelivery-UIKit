//
//  BottomButtonVC.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/25/23.
//

import UIKit

class BottomButtonVC: UIViewController {
    
    var buttonTitle: String {
        return ""
    }
    var verticalInset: CGFloat{
        return 16
    }
    var horizontalInset: CGFloat {
        return 16
    }
    
   
    
    lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 115/255, green: 216/255, blue: 140/255, alpha: 1)
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonTap(_:)), for: .primaryActionTriggered)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bottomButton)
        setupbottomConstraints()
    }
    
    func setupbottomConstraints(){
        let buttonConstraint = [bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)]
        NSLayoutConstraint.activate(buttonConstraint)
    }
    
    
    func buttonAction(){
        print("Action Here")
    }
    
    @objc func buttonTap(_ sender: UIButton){
        self.buttonAction()
    }
    
    
    
    

   

}
