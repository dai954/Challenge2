//
//  RecommendTagCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/24.
//

import UIKit
import RxSwift

class RecommendTagCell: UICollectionViewCell {
    
    static let cellId = "RecommendTagCellId"
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    let tagContanerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.primaryRed().cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    let tagButton: UIButton = {
        let button = UIButton()
        button.setTitle("#タグ", for: .normal)
        button.setTitleColor(UIColor.primaryRed(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()

    
    @objc private func controlTapped() {
        print("controlTapped")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagContanerView)
        
        tagContanerView.addSubview(tagButton)
        tagButton.fillSuperview(padding: .init(top: 0, left: 5, bottom: 0, right: 5))

        tagContanerView.fillSuperview()
        
        tagButton.rx.tap
            .subscribe(onNext: {
                print("tapButton tapped")
            }).disposed(by: disposeBag)
    }
    
    @objc func labelTapped() {
        print("labelTapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
