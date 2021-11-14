//
//  DefaultTableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import UIKit
import RxSwift

class DefaultTableViewCell: TableViewCell {
    
    let teamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        let blackBlindView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            view.alpha = 0.5
            return view
        }()
        imageView.addSubview(blackBlindView)
        blackBlindView.fillSuperview()
        return imageView
    }()

    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "食事記録"
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var memberImage1: UIImageView = createMemberImage()
    lazy var memberImage2: UIImageView = createMemberImage()
    lazy var memberImage3: UIImageView = createMemberImage()
    lazy var memberImage4: UIImageView = createMemberImage()
    lazy var memberImage5: UIImageView = createMemberImage()

    let memberImageSize: CGFloat = 48
    func createMemberImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        let imageSize: CGFloat = memberImageSize
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        return imageView
    }
    
    let defaultContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    var lowerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.primaryGray()
        let memberImageStackView = UIStackView(arrangedSubviews: [
            memberImage1, memberImage2, memberImage3, memberImage4, memberImage5
        ])
        memberImageStackView.distribution = .equalSpacing

        let overallStackView = UIStackView(arrangedSubviews: [
            teamImage, lowerView, UIView()
        ])
        overallStackView.axis = .vertical

        overallStackView.addSubview(memberImageStackView)
        overallStackView.addSubview(teamLabel)
        defaultContainerView.addSubview(overallStackView)
        addSubview(defaultContainerView)

        memberImageStackView.anchor(top: teamImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -memberImageSize/2, left: 20, bottom: 0, right: 20))
        teamLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 30, left: 85, bottom: 0, right: 85))
        overallStackView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
