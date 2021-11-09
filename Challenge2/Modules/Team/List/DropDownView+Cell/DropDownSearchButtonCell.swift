//
//  DropDownSearchButtonCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownSearchButtonCell: UITableViewCell {
    
    static let cellId = "DropDownSearchButtonCellId"
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        button.setTitle("検索する", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        searchButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        addSubview(searchButton)
        
        contentView.isUserInteractionEnabled = false
        
        searchButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: frame.width / 3 + 10, bottom: 10, right: frame.width / 3 + 10))
        searchButton.layer.cornerRadius = 14
    
    }
    
    @objc func handleButton() {
        print("button pressed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
