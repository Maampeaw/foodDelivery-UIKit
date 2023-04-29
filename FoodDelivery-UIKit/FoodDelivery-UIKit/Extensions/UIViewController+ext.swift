//
//  UIViewController.ext.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/25/23.
//

import Foundation
import UIKit

extension UIViewController{
    func setDynamicImage(darkMode:String, lightMode:String)->String{
        switch self.traitCollection.userInterfaceStyle{
        case .dark:
            return darkMode
        case .light:
            return lightMode
        default:
            return lightMode
        }
    }
    
    func showAlert(title: String, message: String, button: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: button, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
