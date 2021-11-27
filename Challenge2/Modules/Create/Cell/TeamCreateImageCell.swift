//
//  TeamCreateImageCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateImageCell: DefaultTableViewCell {
    
    static let teamCreatecellId = "TeamCreateImageCellId"
    
    let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        teamImage.image = #imageLiteral(resourceName: "backImage1")
        memberImage1.image = #imageLiteral(resourceName: "garden")
        
        addSubview(topContainerView)
        topContainerView.addSubview(defaultContainerView)
        defaultContainerView.fillSuperview()
        topContainerView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        topContainerView.clipsToBounds = true
        topContainerView.layer.cornerRadius = 8
        topContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lowerView.constrainHeight(constant: 45)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
