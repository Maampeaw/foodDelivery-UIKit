//
//  TitleWithViewMoreTableViewCell.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 5/1/23.
//

import UIKit

class TitleWithViewMoreTableViewCell: UITableViewCell {
    static let identifier: String = "myIdentifier"
    let titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    let viewMoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.orangeColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "View more"
        return label
    }()
    
   lazy var parentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleHeader, viewMoreLabel])
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.distribution = .fill
       stack.axis = .horizontal
       return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
        contentView.addSubview(parentStack)
        selectionStyle = .none
        backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["parentStack": parentStack]
        let parentStackConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[parentStack]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[parentStack]-|", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(parentStackConstraints)
    }
    
    func renderWith(value: Section){
        titleHeader.text = value.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
