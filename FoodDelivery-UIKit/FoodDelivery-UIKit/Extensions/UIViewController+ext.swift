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
}
