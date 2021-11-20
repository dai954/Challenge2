//
//  TeamDetailImageCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import UIKit
import RxSwift
import RxCocoa

class TeamDetailImageCell: CustomTableViewCell {
    
    static let teamDetailImageCellId = "TeamDetailImageCellId"
    
    let detailTopContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(detailTopContainerView)
        detailTopContainerView.addSubview(defaultContainerView)
        defaultContainerView.fillSuperview()
        detailTopContainerView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        detailTopContainerView.clipsToBounds = true
        detailTopContainerView.layer.cornerRadius = 8
        detailTopContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lowerView.constrainHeight(constant: 45)
    }
    
    func bind(to viewModel: TeamDetailImageCellViewModel) {
        viewModel.title.asDriver().drive(teamLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.imageUrl.map { URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(teamImage.rx.imageURL).disposed(by: disposeBag)
        
        viewModel.avatarImage1.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage1.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage2.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage2.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage3.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage3.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage4.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage4.rx.imageURL).disposed(by: disposeBag)
        viewModel.avatarImage5.map{ URL(string: $0 ?? "") }.asDriver(onErrorJustReturn: nil).drive(memberImage5.rx.imageURL).disposed(by: disposeBag)
        
        viewModel.isPremireHidden?.drive(premireTagImage.rx.isHidden).disposed(by: disposeBag)
        viewModel.isBignnerHidden?.drive(beginerTag.rx.isHidden).disposed(by: disposeBag)
        viewModel.isFullHidden?.drive(fullTeamTag.rx.isHidden).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
