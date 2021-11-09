//
//  TeamDetailImageCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import UIKit

class TeamDetailImageCell: CustomTableViewCell {
    
    static let teamDetailCellId = "TeamDetailImageCellId"

    let detailTopContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(detailTopContainerView)
        detailTopContainerView.addSubview(defaultContainerView)
        defaultContainerView.fillSuperview()
        detailTopContainerView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        detailTopContainerView.clipsToBounds = true
        detailTopContainerView.layer.cornerRadius = 8
        detailTopContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lowerView.constrainHeight(constant: 45)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
