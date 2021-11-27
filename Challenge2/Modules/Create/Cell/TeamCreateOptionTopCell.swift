//
//  TeamCreateOptionTopCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/23.
//

import UIKit

//class TeamCreateOptionTopCell: TeamCreateOptionCell {
//
//    static let teamCreateOptionTopCellId = "TeamCreateOptionTopCellId"
//
//    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        print("reuseIdentifier", reuseIdentifier?.description ?? "no description")
//
//        titleLabel.text = "オプション設定"
//        rightLabel.text = nil
//
//        containerView.clipsToBounds = true
//        containerView.layer.cornerRadius = 8
//        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//
//        rightContainerView.addSubview(rightLabel)
//        rightContainerView.addSubview(pullDownImage)
//
//        containerViewBottomAnchor.isActive = false
//        containerViewBottomAnchor.constant = -10
//        containerViewBottomAnchor.isActive = true
//
//        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
//
//        pullDownImage.anchor(top: nil, leading: nil, bottom: nil, trailing: rightContainerView.trailingAnchor)
//        pullDownImage.centerYInSuperview()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//


class TeamCreateOptionTopCell: TeamCreateOptionDefaultCell {
    
    static let teamCreateOptionTopCellId = "TeamCreateOptionTopCellId"
    
    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "オプション設定"
        rightLabel.text = nil
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

