//
//  CollectionViewHolderTableViewCell.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 5/2/23.
//

import UIKit

class CollectionViewHolderTableViewCell: UITableViewCell {
    static let identifier: String = "CollectionViewCellHolder"
    var data: [Option] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 147, height: 184)
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        self.addSubview(collectionView)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["collectionView": collectionView]
        let collectionViewConstraits = [NSLayoutConstraint.constraints(withVisualFormat: "H:|-[collectionView]-|", metrics: nil, views: views),NSLayoutConstraint.constraints(withVisualFormat: "V:|-[collectionView]-|", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(collectionViewConstraits)
        let contentView = [contentView.heightAnchor.constraint(equalToConstant: 216)]
        NSLayoutConstraint.activate(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData(with value: [Option]){
        self.data = value
    }
    
}

extension CollectionViewHolderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.identifier, for: indexPath) as! RestaurantCollectionViewCell
        cell.render(with: item)
        return cell
    }
    
    
}
