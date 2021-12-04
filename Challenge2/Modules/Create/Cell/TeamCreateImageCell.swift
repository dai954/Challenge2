//
//  TeamCreateImageCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit

class TeamCreateImageCell: CustomTableViewCell {
    
    static let teamCreatecellId = "TeamCreateImageCellId"
    
    let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        teamImage.image = #imageLiteral(resourceName: "backImage1")
        memberImage1.image = #imageLiteral(resourceName: "garden")
        starImage.isHidden = true
        fullTeamTag.isHidden = true
        beginerTag.isHidden = true
        premireTagImage.isHidden = true
        
        
        addSubview(topContainerView)
        topContainerView.addSubview(defaultContainerView)
        defaultContainerView.fillSuperview()
        topContainerView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        topContainerView.clipsToBounds = true
        topContainerView.layer.cornerRadius = 8
        topContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        lowerView.constrainHeight(constant: 45)
        
        NotificationCenter.default.rx.notification(Notification.Name("backImageNotification"), object: nil)
            .subscribe(onNext: { [weak self] notification in
                let image = notification.userInfo.value?["pickedBackImage"] as? UIImage
                self?.teamImage.image = image
            }).disposed(by: disposeBag)
    }
    
    func bind(to viewModel: TeamCreateImageCellViewModel) {
        viewModel.backImageSelection.drive(teamImage.rx.image).disposed(by: disposeBag)
        viewModel.premireIsHidden.drive(premireTagImage.rx.isHidden).disposed(by: disposeBag)
        viewModel.beginnerIsHidden.drive(beginerTag.rx.isHidden).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
