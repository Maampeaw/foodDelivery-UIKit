//
//  HomeViewController.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import UIKit

class HomeViewController: UIViewController {
    var menuStyleToShow: MenuSections? = nil
    var childController: UIViewController?
    let homeViewModel: HomeViewModel = HomeViewModel()
    lazy var bottomNav: BottomMenuBar = {
        let view = BottomMenuBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    let pageDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .heavy)
        label.text = Strings.findFavoriteFood
        label.numberOfLines = 0
        return label
    }()
    
    let bellImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "Icon Notifiaction")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var imageStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bellImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11)
        stackView.layer.cornerRadius = 15
        stackView.backgroundColor = UIColor(dynamicProvider: { trait in
            switch trait.userInterfaceStyle{
            case .light:
                return .white
            case .dark:
                return .white.withAlphaComponent(0.1)
            default:
                return .white
            }
        })
        return stackView
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.barStyle = .default
        view.layer.borderWidth = 0

        view.searchBarStyle = .minimal
        return view
    }()
    
    let filterTab: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.backgroundColor = .clear
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
        self.view.addSubviews( pageDescriptionLabel, imageStack, searchBar, filterTab, tableView, bottomNav)
        
        setupConstraints()
        bottomNav.toggleSelectedCart(with: .home)
        switch traitCollection.userInterfaceStyle{
        case .light:
            filterTab.image = UIImage(named: "filterLight")
        case .dark:
            filterTab.image = UIImage(named: "fffblack")
        default:
            print("default")
        }
        tableView.register(TitleWithViewMoreTableViewCell.self, forCellReuseIdentifier: TitleWithViewMoreTableViewCell.identifier)
        tableView.register(CollectionViewHolderTableViewCell.self, forCellReuseIdentifier: CollectionViewHolderTableViewCell.identifier)
        tableView.register(PopularMenuTableViewCell.self, forCellReuseIdentifier: PopularMenuTableViewCell.identifire)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.view.bringSubviewToFront(bottomNav)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        switch previousTraitCollection?.userInterfaceStyle{
        case .dark:
            filterTab.image = UIImage(named: "filterLight")
        case .light:
            filterTab.image = UIImage(named: "fffblack")
        default:
            print("default")
        }
    }
    
    func setupConstraints(){
        let views = ["pageDesc": pageDescriptionLabel,"bellImage": bellImage]
        let bottomNavConstraints = [bottomNav.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottomNav.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), bottomNav.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)]
        NSLayoutConstraint.activate(bottomNavConstraints)
        let pageDescLabelConstraints = [NSLayoutConstraint.constraints(withVisualFormat: "H:|-(30)-[pageDesc]", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[pageDesc]", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(pageDescLabelConstraints)
        let bellImageConstraint = [bellImage.heightAnchor.constraint(equalToConstant: 23), bellImage.widthAnchor.constraint(equalToConstant: 19)]
        NSLayoutConstraint.activate(bellImageConstraint)
        let imageStackConstraints = [imageStack.centerYAnchor.constraint(equalTo: pageDescriptionLabel.centerYAnchor), imageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31)]
        NSLayoutConstraint.activate(imageStackConstraints)
        let filterTabConstraints = [filterTab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31), filterTab.topAnchor.constraint(equalTo: pageDescriptionLabel.bottomAnchor, constant: 18), filterTab.widthAnchor.constraint(equalToConstant: 49), filterTab.heightAnchor.constraint(equalToConstant: 50)]
        NSLayoutConstraint.activate(filterTabConstraints)
        
        let searchbarConstraints = [searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31), searchBar.topAnchor.constraint(equalTo: pageDescriptionLabel.bottomAnchor, constant: 18), searchBar.heightAnchor.constraint(equalToConstant: 50), searchBar.trailingAnchor.constraint(equalTo: filterTab.leadingAnchor, constant: -8)]
        NSLayoutConstraint.activate(searchbarConstraints)
        
        let tableViewConstraints = [tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), tableView.topAnchor.constraint(equalTo: filterTab.bottomAnchor, constant: 30), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
        NSLayoutConstraint.activate(tableViewConstraints)
        
        
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = homeViewModel.data[section]
        if section.options.count > 0{
            return section.options.count + 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = homeViewModel.data[indexPath.section]
        print(section)
        if indexPath.row == 0{
            print(section.cellStyle)
            switch section.cellStyle{
            case .titleAndViewMore:
                let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithViewMoreTableViewCell.identifier, for: indexPath) as! TitleWithViewMoreTableViewCell
                cell.renderWith(value: section)
                return cell
            default:
                return UITableViewCell()
            }
        }else{
            if section.options.count > 0{
                let option = section.options[indexPath.row - 1]
                switch option.cellStyle{
                case .collectionViewCell:
                    let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewHolderTableViewCell.identifier, for: indexPath) as! CollectionViewHolderTableViewCell
                    cell.setupData(with: option.items)
                    return cell
                case .NormalTableViewCell:
                    let cell = tableView.dequeueReusableCell(withIdentifier: PopularMenuTableViewCell.identifire, for: indexPath) as! PopularMenuTableViewCell
                    cell.render(with: option)
                    return cell
                default:
                    return UITableViewCell()
                }
                    
                
            }
        }
       
        return UITableViewCell()
    }
    
    
}

extension HomeViewController: MenuActionDelegate{
    func menuOnTap(menuSection: MenuSections) {
        bottomNav.toggleSelectedCart(with: menuSection)
        switch menuSection{
        case .profile:
            removeControlleFromParent()
            makeControllerActive(with: .profile)
        case .cart:
            removeControlleFromParent()
            makeControllerActive(with: .cart)
        case .chat:
            removeControlleFromParent()
            makeControllerActive(with: .chat)
        default:
            removeControlleFromParent()
            
        }
    }
    
}


extension HomeViewController{
    func makeControllerActive(with menuType: MenuSections){
        var controller: UIViewController
        switch menuType{
        case .home:
            controller = UINavigationController(rootViewController:HomeViewController())
        case .cart:
            controller = UINavigationController(rootViewController: CartViewController())
        case .profile:
            controller = UINavigationController(rootViewController: ProfileViewController())
        case .chat:
            controller = UINavigationController(rootViewController: ChatViewController())
        }
            self.addChild(controller)
            self.view.addSubview(controller.view)
            let views = ["view": controller.view]
            NSLayoutConstraint.activate([
                NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", metrics: nil, views: views as [String : Any]),
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", metrics: nil, views: views as [String : Any])
            ].flatMap{$0})
            controller.didMove(toParent: self)
            self.view.bringSubviewToFront(bottomNav)
            self.childController = controller
    }
    
    func removeControlleFromParent(){
        childController?.willMove(toParent: nil)
        childController?.view.removeFromSuperview()
        childController?.removeFromParent()
    }
    
    
}
