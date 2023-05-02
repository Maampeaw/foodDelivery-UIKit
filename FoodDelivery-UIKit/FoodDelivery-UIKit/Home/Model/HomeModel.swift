//
//  HomeModel.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/29/23.
//

import Foundation

struct HomeModel{
    let category: String
    let items: [Restaurant]
    
}


struct Restaurant{
    var imageName, restaurantName, preparationTime, cost: String
}
