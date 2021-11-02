//
//  TeamListTableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

import UIKit

class TeamListTableViewCell: CustomTableViewCell {
    let teamDescription: UILabel = {
        let label = UILabel()
        label.text = "健康な生活は健全な食事生活から、偏った食事にならないように気をつけていきましょう！　（オーナーはオーナー専用メニューからチーム名やこの説明文を編集することができます。"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lowerView.backgroundColor = .white
        backgroundColor = UIColor.primaryGray()
        lowerView.addSubview(teamDescription)
        teamDescription.fillSuperview(padding: .init(top: 10, left: 20, bottom: 0, right: 20))
//        lowerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
