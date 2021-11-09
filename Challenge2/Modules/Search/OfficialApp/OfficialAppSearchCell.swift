//
//  OfficialAppSearchCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class OfficialAppSearchCell: UICollectionViewCell {
    
    static let cellId = "officialAppSearchCellId"
    
    let appImage: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let appLabel: UILabel = {
        let label = UILabel()
        label.text = "アプリ名 \n みんちゃれ"
        label.font = .systemFont(ofSize: 8)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        appImage.widthAnchor.constraint(equalToConstant: 48).isActive = true
        appImage.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        appLabel.textAlignment = .center
        let verticalStackView = UIStackView(arrangedSubviews: [
        UIView(),appImage, appLabel, UIView()
        ])
        verticalStackView.alignment = .center
        verticalStackView.spacing = 10
        
        verticalStackView.axis = .vertical
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
