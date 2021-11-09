//
//  DropDownTextFieldCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownTextFieldCell: UITableViewCell {
    
    static let cellId = "DropDownTextFieldCellId"
    
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.text = "キーワード"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "キーワード入力"
        field.tintColor = .darkGray
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(keywordLabel)
        addSubview(separateLabel)
        addSubview(textField)
        contentView.isUserInteractionEnabled = false
        
        keywordLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 112, height: 0))
        separateLabel.anchor(top: keywordLabel.topAnchor, leading: keywordLabel.trailingAnchor, bottom: keywordLabel.bottomAnchor,trailing: nil, size: .init(width: 8, height: 0))
        textField.anchor(top: separateLabel.topAnchor, leading: separateLabel.trailingAnchor, bottom: separateLabel.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
