//
//  BottomView.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import UIKit

class BottomView: UIView {
   
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "チームが自分に合わなかったら"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "退出して大丈夫ですよ。まずは一歩を踏み出そう。"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    let partInButton: UIButton = {
        let button = UIButton()
         button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
         button.setTitle("初チーム参加で500コインを獲得する", for: .normal)
         button.heightAnchor.constraint(equalToConstant: 42).isActive = true
         button.layer.cornerRadius = 21
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [firstLabel, secondLabel, partInButton])
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 40, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
