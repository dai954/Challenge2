//
//  TeamCreateOptionBottomCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/23.
//

import UIKit

//class TeamCreateOptionBottomCell: TeamCreateOptionCell {
//
//    static let teamCreateOptionBottomCellId = "TeamCreateOptionBottomCellId"
//
//    let icon: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = #imageLiteral(resourceName: "cat1")
//        imageView.constrainWidth(constant: 30)
//        imageView.constrainHeight(constant: 30)
//        return imageView
//    }()
//
//    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        print("reuseIdentifier", reuseIdentifier?.description ?? "no description")
//
//        titleLabel.text = "アシスタント"
//        rightLabel.text = "イエロー"
//        rightLabel.textColor = .lightGray
//
//        containerView.clipsToBounds = true
//        containerView.layer.cornerRadius = 8
//        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//
//        rightContainerView.addSubview(icon)
//
//        // Creating bottom space
//        containerViewBottomAnchor.isActive = false
//        containerViewBottomAnchor.constant = -10
//        containerViewBottomAnchor.isActive = true
//
//        icon.anchor(top: nil, leading: nil, bottom: nil, trailing: rightLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
//        icon.centerYInSuperview()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

class TeamCreateOptionBottomCell: TeamCreateOptionDefaultCell {
    
    static let teamCreateOptionBottomCellId = "TeamCreateOptionBottomCellId"
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cat1")
        imageView.constrainWidth(constant: 30)
        imageView.constrainHeight(constant: 30)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "アシスタント"
        rightLabel.text = "イエロー"
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        rightContainerView.addSubview(icon)

        icon.anchor(top: nil, leading: nil, bottom: nil, trailing: rightLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        icon.centerYInSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
