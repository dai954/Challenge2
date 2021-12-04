//
//  TeamCreatePremiumCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreatePremiumCell: TeamCreateDefaultCell {
    static let cellId = "TeamCreatePremiumCellId"
    
    let questionButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.primaryRed()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.constrainWidth(constant: 15)
        button.constrainHeight(constant: 15)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        titleLabel.text = "プレミアム専用チーム"
        
        accessoryView = switchButton
        containerView.addSubview(questionButton)
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        
        questionButton.anchor(top: nil, leading: titleLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        questionButton.centerYInSuperview()

    }
    
    func bind(to viewModel: TeamCreatePremiumCellViewModel) {
        viewModel.premiumSwitchIsEnabled.drive(switchButton.rx.isEnabled).disposed(by: disposeBag)
        viewModel.premiumTitleAlpha.drive(rx.alpha).disposed(by: disposeBag)
        
        let input = TeamCreatePremiumCellViewModel.Input(questionButtonTapped: questionButton.rx.tap.asSignal())
        viewModel.wireAction(input: input)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
