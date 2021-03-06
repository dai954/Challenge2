//
//  CustomTableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

import UIKit

class CustomTableViewCell: DefaultTableViewCell {
    
    static let cellId = "CustomTableViewCellId"

    let beginerTag: UILabel = {
        let label = UILabel()
        label.text = "初心者歓迎"
        label.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let premireTagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bow")
        imageView.tintColor = .white
        var transRotate = CGAffineTransform()
        let angle = -35 * CGFloat.pi / 180
        transRotate = CGAffineTransform(rotationAngle: CGFloat(angle));
        imageView.transform = transRotate
        return imageView
    }()
    
    let fullTeamTag: UILabel = {
        let label = UILabel()
        label.text = "満員"
        label.backgroundColor = UIColor.primaryRed()
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
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
        
        teamImage.addSubview(beginerTag)
        teamImage.addSubview(fullTeamTag)
        
        teamImage.addSubview(starImage)
        teamImage.addSubview(premireTagImage)
        
        beginerTag.anchor(top: teamImage.topAnchor, leading: teamImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 8, bottom: 0, right: 0), size: .init(width: 70, height: 20))
        fullTeamTag.anchor(top: teamImage.topAnchor, leading: teamImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 8, bottom: 0, right: 0), size: .init(width: 40, height: 20))
        
        starImage.anchor(top: teamImage.topAnchor, leading: nil, bottom: nil, trailing: teamImage.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 8), size: .init(width: 20, height: 20))
     
        premireTagImage.anchor(top: teamImage.topAnchor, leading: teamImage.leadingAnchor, bottom: nil, trailing: nil, size: .init(width: 30, height: 30))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
