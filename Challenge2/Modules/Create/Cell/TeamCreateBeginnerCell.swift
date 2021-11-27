//
//  TeamCreateBeginerCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/25.
//

import UIKit

class TeamCreateBeginnerCell: TeamCreateDefaultCell {
    static let cellId = "TeamCreateBeginnerCellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        titleLabel.text = "初心者歓迎アイコン"
        accessoryView = switchButton
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
