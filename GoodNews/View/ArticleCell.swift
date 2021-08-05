//
//  ArticleCell.swift
//  GoodNews
//
//  Created by Taisei Sakamoto on 2021/03/09.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    //MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 4
        addSubview(stack)
        stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
