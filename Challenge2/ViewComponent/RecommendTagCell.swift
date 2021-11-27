//
//  RecommendTagCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/24.
//

import UIKit

class RecommendTagCell: UICollectionViewCell {
    
    static let cellId = "RecommendTagCellId"
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor.primaryRed()
        label.text = "#タグ"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let tagContanerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.primaryRed().cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagContanerView)
        tagContanerView.addSubview(tagLabel)
        
        tagLabel.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        tagContanerView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
