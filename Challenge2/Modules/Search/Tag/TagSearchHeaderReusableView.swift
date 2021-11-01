//
//  TagHeader.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import UIKit

class TagSearchHeaderReusableView: UICollectionReusableView {
    
    static let headerReusableViewId = "TagHeaderReusableView"

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "headerSample"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(headerLabel)
        headerLabel.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

