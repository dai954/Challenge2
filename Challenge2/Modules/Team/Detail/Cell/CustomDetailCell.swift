//
//  CustomDetailCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/06.
//

import UIKit

class CustomDetailCell: TableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var containerViewBottomAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.primaryGray()
        addSubview(containerView)
        
//        containerView.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerViewBottomAnchor = containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        containerViewBottomAnchor.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
