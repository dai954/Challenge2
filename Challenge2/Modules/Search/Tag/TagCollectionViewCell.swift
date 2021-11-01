//
//  TagCollectionViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "TagCollectionViewCell"

    var tagLabel: UILabel = {
        let label = UILabel()
        label.text = "sample"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 12
        
        addSubview(tagLabel)
        tagLabel.fillSuperview(padding: .init(top: 8, left: 12, bottom: 8, right: 12))
        tagLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

