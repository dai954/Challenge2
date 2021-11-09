//
//  DetailDescriptionCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class DetailDescriptionCell: CustomDetailCell {
    
    static let cellId = "DetailDescriptionCellId"
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "body ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNNbody ------------ body _____//// \n bodyNNNN"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 10, left: 20, bottom: 10, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
