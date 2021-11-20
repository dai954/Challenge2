//
//  otherInfoCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import RxSwift
import RxCocoa

class DetailInfoCell: CustomDetailCell {
    
    static let cellId = "DetailInfoCellId"
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "最終更新"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "7月29日 23:07"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let questionButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.primaryRed()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        return button
    }()
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.constrainWidth(constant: 30)
        image.constrainHeight(constant: 30)
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.isHidden = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .gray
        contentView.isUserInteractionEnabled = false
        makeUI()
    }
    
    private func makeUI() {
        containerView.addSubview(leftLabel)
        containerView.addSubview(questionButton)
        containerView.addSubview(rightLabel)
        containerView.addSubview(icon)

        leftLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        questionButton.anchor(top: containerView.topAnchor, leading: leftLabel.trailingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0))
        rightLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        icon.anchor(top: nil, leading: nil, bottom: nil, trailing: rightLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5))
        icon.centerYInSuperview()
    }
    
    func bind(to viewModel: DetailInfoCellViewModel) {
        viewModel.title.drive(leftLabel.rx.text).disposed(by: disposeBag)
        viewModel.info.drive(rightLabel.rx.text).disposed(by: disposeBag)
        viewModel.isQuestionLabelHidden.drive(questionButton.rx.isHidden).disposed(by: disposeBag)
        viewModel.assistantColor.drive(icon.rx.image).disposed(by: disposeBag)
        viewModel.isAssistantHidden.drive(icon.rx.isHidden).disposed(by: disposeBag)
        
        let prepareForReuseObservable = self.rx.sentMessage(#selector(UITableViewCell.prepareForReuse))
        let input = DetailInfoCellViewModel.Input(questionButtonTapped: questionButton.rx.tap.take(until: prepareForReuseObservable).asSignal(onErrorJustReturn: ()))
        viewModel.wireAction(input: input)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
