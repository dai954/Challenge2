//
//  CategorySearchCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

class SearchCategoryCell: UICollectionViewCell {
    
    static let cellId = "CategoryCell"
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.text = "サンプル運動"
        return label
    }()
    
    let categoryImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "meow2")
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        clipsToBounds = true
        
        categoryLabel.textAlignment = .center
        
        let dummyView1 = UIView()
        dummyView1.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        let dummyView2 = UIView()
        dummyView2.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
        categoryImage, dummyView1, categoryLabel, dummyView2
        ])
        stackView.contentMode = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

