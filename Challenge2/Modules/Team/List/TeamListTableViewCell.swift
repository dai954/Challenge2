//
//  TeamListTableViewCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/28.
//

import UIKit
import RxSwift
import RxCocoa

class TeamListTableViewCell: CustomTableViewCell {
    
    static let teamListCell = "teamListCell"
    
    let teamDescription: UILabel = {
        let label = UILabel()
        label.text = "健康な生活は健全な食事生活から、偏った食事にならないように気をつけていきましょう！　（オーナーはオーナー専用メニューからチーム名やこの説明文を編集することができます。"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroudViewClear()
        
        addSubview(containerView)
        containerView.fillSuperview(padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        
        containerView.addSubview(defaultContainerView)
        defaultContainerView.fillSuperview()
        
        lowerView.backgroundColor = .white
        backgroundColor = UIColor.primaryGray()
        lowerView.addSubview(teamDescription)
        teamDescription.fillSuperview(padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        lowerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
    
    private func selectedBackgroudViewClear() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        selectedBackgroundView = backgroundView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(to viewModel: TeamListCellViewModel) {
        viewModel.title.asDriver().drive(teamLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.imageUrl.map { URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(teamImage.rx.imageURL).disposed(by: disposeBag)
        
        viewModel.avatarImage1.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage1.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage2.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage2.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage3.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage3.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage4.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage4.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage5.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage5.rx.imageURL).disposed(by: disposeBag)
        
        viewModel.description.asDriver(onErrorJustReturn: nil).drive(teamDescription.rx.text).disposed(by: disposeBag)
    }
    
}
