//
//  HomeViewController.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var bottomNav: BottomMenuBar = {
        let view = BottomMenuBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle{
            case .light:
                return UIColor(red: 247/255, green: 247/255, blue: 255/255, alpha: 1)
            case .dark:
                return .black
            default:
                return .white
            }
        })
        self.view.addSubview(bottomNav)
        setupConstraints()
        bottomNav.toggleSelectedCart(with: .home)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupConstraints(){
        let bottomNavConstraints = [bottomNav.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottomNav.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), bottomNav.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)]
        NSLayoutConstraint.activate(bottomNavConstraints)
        
    }

}

extension HomeViewController: MenuActionDelegate{
    func menuOnTap(menuSection: MenuSections) {
        bottomNav.toggleSelectedCart(with: menuSection)
    }
    
}
