//
//  FavoriteRegisterCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import RxSwift
import RxCocoa

class FavoriteRegisterCell: CustomDetailCell {
    
    static let cellId = "FavoriteRegisterCellId"
    
    let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "現在0人がお気に入りしています"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let favoriteButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        button.setTitle("お気に入りに登録する", for: .normal)
        button.tintColor = .white
        let image = UIImage(systemName: "star")
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray

        containerView.addSubview(favoriteLabel)
        containerView.addSubview(favoriteButton)
        
        favoriteLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0))
        favoriteButton.anchor(top: favoriteLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
    }

    func bind(to viewModel: FavoriteRegisterCellViewModel) {
//        viewModel.numberOfFavoriteText.bind(to: favoriteLabel.rx.attributedText).disposed(by: disposeBag)
        viewModel.numberOfFavoriteText.subscribe(onNext: { attrText in
            self.favoriteLabel.attributedText = attrText
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
