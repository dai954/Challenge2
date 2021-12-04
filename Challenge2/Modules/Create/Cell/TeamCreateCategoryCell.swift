//
//  CreateCategoryCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class TeamCreateCategoryCell: TeamCreateDefaultCell {
    static let cellId = "TeamCreateCategoryCellId"
    
    override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "カテゴリー"
        rightLabel.text = "選択"
        rightLabel.textColor = .lightGray
        
        rightContainerView.addSubview(rightLabel)
        rightContainerView.addSubview(pullDownImage)
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        
        pullDownImage.anchor(top: nil, leading: nil, bottom: nil, trailing: rightContainerView.trailingAnchor)
        pullDownImage.centerYInSuperview()
        
        rightLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: pullDownImage.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        rightLabel.centerYInSuperview()
        
    }
    
    func bind(to viewModel: TeamCreateCategoryCellViewModel) {
        
        viewModel.categoryCellTapped.drive(rightLabel.rx.text).disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
