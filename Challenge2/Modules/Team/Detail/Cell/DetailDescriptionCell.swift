//
//  DetailDescriptionCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit
import RxSwift
import RxCocoa

class DetailDescriptionCell: CustomDetailCell {
    
    static let cellId = "DetailDescriptionCellId"
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "body ------------ body ---------- \n body --------- body ---------- \n body ----------- body ---------- \n body ------------ body ----------- \n body -----------"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    deinit {
        print("DetailDescriptionCell deinit")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("DetailDescriptionCell init")
//        backgroundColor = .gray
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 10, left: 20, bottom: 10, right: 0))
    }
    
    func bind(to viewModel: DetailDescriptionCellViewModel) {
        
        viewModel.description
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
