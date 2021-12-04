//
//  DefaultTeamCreateCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateDefaultCell: TableViewCell {
   
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let switchButton: UISwitch = {
        let sb = UISwitch()
//        sb.isUserInteractionEnabled = true
        sb.isOn = false
        return sb
    }()

    let pullDownImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.constrainWidth(constant: 15)
        imageView.constrainHeight(constant: 15)
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let rightContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var containerViewBottomAnchor: NSLayoutConstraint = NSLayoutConstraint()
    var containerViewTopAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.primaryGray()
        selectionStyle = .none
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(rightContainerView)
        containerView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerViewTopAnchor = containerView.topAnchor.constraint(equalTo: topAnchor)
        containerViewTopAnchor.isActive = true
        containerViewBottomAnchor = containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        containerViewBottomAnchor.isActive = true
        
        rightContainerView.anchor(top: containerView.topAnchor, leading: nil, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 15))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
