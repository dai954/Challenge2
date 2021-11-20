//
//  DetailScreenShotCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import RxSwift
import RxCocoa

class DetailScreenshotCell: CustomDetailCell {

    static let cellId = "DetailScreenshotCellId"
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "最近のやりとり"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let bottomLabel:UILabel = {
        let label = UILabel()
        label.text = "発言内容を公開設定にしているメンバーの、発言のみが表示されます。"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()

    let screenshotCollectionViewController = ScreenshotCollectionViewController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray
        contentView.isUserInteractionEnabled = false
        
        screenshotCollectionViewController.view.constrainHeight(constant: 300)
        let stackView = UIStackView(arrangedSubviews: [
            topLabel, screenshotCollectionViewController.view, bottomLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        containerView.addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    func bind(to viewModel: DetailScreenshotCellViewModel) {
        
        viewModel.screenshotSections
            .drive(screenshotCollectionViewController.viewModel.screenshotSections)
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
