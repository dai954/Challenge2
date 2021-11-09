//
//  otherInfoCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class DetailInfoCell: CustomDetailCell {
    
    static let cellId = "DetailInfoCellId"
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "最終更新"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "7月29日 23:07"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let questionButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.primaryRed()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        return button
    }()
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        image.constrainWidth(constant: 10)
        image.constrainHeight(constant: 10)
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray
        containerView.addSubview(leftLabel)
        containerView.addSubview(questionButton)
        containerView.addSubview(rightLabel)
        containerView.addSubview(icon)

        leftLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        questionButton.anchor(top: containerView.topAnchor, leading: leftLabel.trailingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0))
        rightLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        icon.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: rightLabel.leadingAnchor, padding: .init(top: 9, left: 0, bottom: 0, right: 5))


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
