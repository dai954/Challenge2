//
//  OfficialAppSearchHeaderCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class OfficialAppSearchHeaderCell: UICollectionReusableView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "公式チャレンジ"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
//        label.backgroundColor = UIColor.primaryGray()
//        label.backgroundColor = .green
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        headerLabel.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
