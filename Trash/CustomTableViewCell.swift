//
//  CustomTableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

import UIKit

class CustomTableViewCell: DefaultTableViewCell {

    let beginerTag: UILabel = {
        let label = UILabel()
        label.text = "初心者歓迎"
        label.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(beginerTag)
        addSubview(starImage)
        
        beginerTag.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 16, bottom: 0, right: 0), size: .init(width: 80, height: 24))
        starImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 16), size: .init(width: 20, height: 20))
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
