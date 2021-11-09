//
//  BottomAlertCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class ReportButtonCell: CustomDetailCell {
    
    static let cellId = "ReportButtonCellId"
    
    let reportButton: UIButton = {
        let button = UIButton(frame: .init(x: 20, y: 10, width: 150, height: 15))
        button.setTitle("このチームを通報する", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        let image = UIImage(systemName: "exclamationmark.bubble")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let paddingDummyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.primaryGray()
        view.constrainHeight(constant: 30)
        return view
    }()
    
    let roundDummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.constrainHeight(constant: 30)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray

        let buttonParentView = UIView()
        buttonParentView.backgroundColor = .white
        buttonParentView.constrainHeight(constant: 25)
        buttonParentView.addSubview(reportButton)
        
        let dummyView = UIView()
        dummyView.backgroundColor = UIColor.primaryGray()
        
        let stackView = UIStackView(arrangedSubviews: [buttonParentView, roundDummyView, paddingDummyView, dummyView])
        
        containerView.backgroundColor = UIColor.primaryGray()
        stackView.axis = .vertical
        containerView.addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
