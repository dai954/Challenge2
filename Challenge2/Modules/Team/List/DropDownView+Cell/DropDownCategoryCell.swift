//
//  DropDownCategoryCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownCategoryCell: UITableViewCell {
    
    static let cellId = "DropDownCategoryCellId"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "カテゴリー"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let categorySearchButton: UIButton = {
        let button = UIButton()
        button.setTitle("歩く", for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.tintColor = .black
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(categoryLabel)
        addSubview(separateLabel)
        addSubview(categorySearchButton)
        contentView.isUserInteractionEnabled = false

        categoryLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 112, height: 0))
        separateLabel.anchor(top: categoryLabel.topAnchor, leading: categoryLabel.trailingAnchor, bottom: categoryLabel.bottomAnchor,trailing: nil, size: .init(width: 8, height: 0))
        categorySearchButton.anchor(top: separateLabel.topAnchor, leading: separateLabel.trailingAnchor, bottom: separateLabel.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
