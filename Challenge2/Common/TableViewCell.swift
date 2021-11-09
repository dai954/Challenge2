//
//  TableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/06.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    let containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
