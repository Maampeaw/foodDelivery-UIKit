//
//  RestaurantViewModel.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/29/23.
//

import Foundation


enum cellStyles{
    case titleAndViewMore
    case collectionViewCell
    case NormalTableViewCell
}

struct Option{
    var imageName: String = ""
    var title: String = ""
    var preparationTime: String = ""
    var cost: String = ""
    var items: [Option] = []
    var cellStyle: cellStyles
}

struct Section{
    var title: String
    var options: [Option]
    var cellStyle: cellStyles = .titleAndViewMore
}

struct HomeViewModel{
    var data = [
        Section(title: "Nearest Restaurants", options: [Option(items: [Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell), Option(imageName: "vegan",title: "Vegan Resto", preparationTime: "10 mins", cellStyle: .collectionViewCell)], cellStyle: .collectionViewCell)]),
        Section(title: "Popular Menu", options: [Option(imageName: "pizza", title: "Herbal Pancake", preparationTime: "10 mins", cost: "$30", cellStyle: .NormalTableViewCell), Option(imageName: "pizza", title: "Herbal Pancake", preparationTime: "10 mins", cost: "$30", cellStyle: .NormalTableViewCell), Option(imageName: "pizza", title: "Herbal Pancake", preparationTime: "10 mins", cost: "$30", cellStyle: .NormalTableViewCell), Option(imageName: "pizza", title: "Herbal Pancake", preparationTime: "10 mins", cost: "$30", cellStyle: .NormalTableViewCell)])
    ]
    
}
