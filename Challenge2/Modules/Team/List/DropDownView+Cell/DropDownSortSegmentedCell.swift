//
//  DropDownSortSegmentedCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownSortSegmentedCell: UITableViewCell {
    
    static let cellId = "DropDownSortSegmentedCellId"
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "表示順"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let items = ["更新順", "達成率順", "残り時間順"]
    
    lazy var segmentedControl = DropDownSearchSegmentedCell.createSegment(items: items)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [
            orderLabel ,segmentedControl
        ])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        addSubview(stackView)
        contentView.isUserInteractionEnabled = false
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
