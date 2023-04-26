//
//  MyCustomTextField.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class MyCustomTextField: UITextField {
    let padding: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 16
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    
}
