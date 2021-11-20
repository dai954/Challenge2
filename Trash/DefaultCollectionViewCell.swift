//
//  DefaultCollectionViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

//import UIKit
//
//class DefaultCollectionViewCell: UICollectionViewCell {
//
//    let teamImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .red
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
//        let blackBlindView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .black
//            view.alpha = 0.5
//            return view
//        }()
//        imageView.addSubview(blackBlindView)
//        blackBlindView.fillSuperview()
//        return imageView
//    }()
//
//    let teamLabel: UILabel = {
//        let label = UILabel()
//        label.text = "食事記録"
//        label.numberOfLines = 1
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
//
//    lazy var memberImage1: UIImageView = createMemberImage()
//    lazy var memberImage2: UIImageView = createMemberImage()
//    lazy var memberImage3: UIImageView = createMemberImage()
//    lazy var memberImage4: UIImageView = createMemberImage()
//    lazy var memberImage5: UIImageView = createMemberImage()
//
//    let memberImageSize: CGFloat = 48
//    func createMemberImage() -> UIImageView {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .yellow
//        let imageSize: CGFloat = memberImageSize
//        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
//        imageView.layer.cornerRadius = imageSize / 2
//        imageView.clipsToBounds = true
//        return imageView
//    }
//
//    var lowerView = UIView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        clipsToBounds = true
//        layer.cornerRadius = 8
//
//        let memberImageStackView = UIStackView(arrangedSubviews: [
//            memberImage1, memberImage2, memberImage3, memberImage4, memberImage5
//        ])
//        memberImageStackView.distribution = .equalSpacing
//
//        let overallStackView = UIStackView(arrangedSubviews: [
//            teamImage, lowerView
//        ])
//        overallStackView.axis = .vertical
//
//        overallStackView.addSubview(memberImageStackView)
//        overallStackView.addSubview(teamLabel)
//        addSubview(overallStackView)
//
//        memberImageStackView.anchor(top: teamImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -memberImageSize/2, left: 10, bottom: 0, right: 10))
//        teamLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 25, left: 64, bottom: 0, right: 64))
//        overallStackView.fillSuperview()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
