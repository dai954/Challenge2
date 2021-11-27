//
//  CreateOptionalCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateHeaderImageCell: TeamCreateDefaultCell, PickableCellType {
    
    static let cellId = "HeaderImageCellId"
    
    let pickerKeyboardView = GeneralPickerKiyboardView(pickerKeyboardType: .selectBackImage)
    
    let headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.constrainWidth(constant: 30)
        imageView.constrainHeight(constant: 30)
        imageView.image = #imageLiteral(resourceName: "backImage1")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pickerKeyboardView)
        titleLabel.text = "ヘッダー画像"

        rightContainerView.addSubview(headerImage)
        rightContainerView.addSubview(pullDownImage)
    
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        
        pullDownImage.anchor(top: nil, leading: nil, bottom: nil, trailing: rightContainerView.trailingAnchor)
        pullDownImage.centerYInSuperview()
        headerImage.centerYInSuperview()
        headerImage.anchor(top: nil, leading: nil, bottom: nil, trailing: pullDownImage.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
