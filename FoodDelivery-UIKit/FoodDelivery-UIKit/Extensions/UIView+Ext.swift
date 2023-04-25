//
//  UIView+Ext.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/25/23.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...){
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
