//
//  CategorySearchFooterCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class CategorySearchFooterReusableView: UICollectionReusableView {
    
    static let footerReusableViewId = "CategorySearchfooterReusableViewId"
    
    let favoriteButton: UIButton = {
       let button = UIButton()
        button.setTitle("お気に入り", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 0)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(favoriteButton)
        favoriteButton.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

