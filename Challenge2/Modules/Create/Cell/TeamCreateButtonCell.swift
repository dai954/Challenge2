//
//  CreateTeamButtonCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/23.
//

import UIKit

class TeamCreateButtonCell: TeamCreateDefaultCell {
    
    static let cellId = "TeamCreateButtonCellId"
    
    let teamCreateButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("チームを作る", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        
        containerView.addSubview(teamCreateButton)
        
        containerViewTopAnchor.isActive = false
        containerViewTopAnchor.constant = 10
        containerViewTopAnchor.isActive = true
        
        teamCreateButton.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
