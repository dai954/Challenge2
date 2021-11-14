//
//  screenshotCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import UIKit

class ScreenShotCell: UICollectionViewCell {
    
    static let cellId = "ScreenShotCellId"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .green
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
