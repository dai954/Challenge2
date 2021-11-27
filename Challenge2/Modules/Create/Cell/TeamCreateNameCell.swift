//
//  CreateTeamNameCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateNameCell: TeamCreateDefaultCell {
    
    static let cellId = "TeamCreateNameCellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        titleLabel.text = "チーム名"
        rightLabel.text = "15文字以内"
        rightLabel.font = .systemFont(ofSize: 12)
        textField.placeholder = "入力してください"
        
        containerView.addSubview(textField)
        rightContainerView.addSubview(rightLabel)
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        rightLabel.anchor(top: rightContainerView.topAnchor, leading: nil, bottom: nil, trailing: rightContainerView.leadingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        textField.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 8, left: 20, bottom: 8, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
