//
//  CreateOptionalCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateOptionCell: TeamCreateOptionDefaultCell {
    
    static let cellId = "TeamCreateOptionCellId"
    
    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.text = "メンバー募集"
        rightLabel.text = "オープン"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
