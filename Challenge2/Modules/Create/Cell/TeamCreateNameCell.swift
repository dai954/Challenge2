//
//  CreateTeamNameCell.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class TeamCreateNameCell: TeamCreateDefaultCell {
    
    static let cellId = "TeamCreateNameCellId"
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "入力してください"
        return field
    }()
    
    let redBlindView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .clear
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        titleLabel.text = "チーム名"
        rightLabel.text = "15文字以内"
        rightLabel.font = .systemFont(ofSize: 12)
        
        containerView.addSubview(textField)
        rightContainerView.addSubview(rightLabel)
        containerView.addSubview(redBlindView)
        
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 12, left: 20, bottom: 12, right: 20))
        rightLabel.anchor(top: rightContainerView.topAnchor, leading: nil, bottom: nil, trailing: rightContainerView.leadingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        textField.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 8, left: 20, bottom: 8, right: 20))
        redBlindView.fillSuperview()
    }
    
    func bind(to viewModel: TeamCreateNameCellViewModel) {
        
        viewModel.parentViewTappedTrigger.drive(onNext: { [weak self] in
            self?.textField.resignFirstResponder()
        }).disposed(by: disposeBag)
        
        let input = TeamCreateNameCellViewModel.Input(textFieldEditingEvent: textField.rx.text.asDriver().filterNil())
        let output = viewModel.transform(input: input)
        
        output.validatedTextField.drive(rightLabel.rx.textFieldValidationResult).disposed(by: disposeBag)
        output.validatedTextField.drive(redBlindView.rx.textFieldValidationResult).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension Reactive where Base: TeamCreateNameCell {
    
    var textFieldDidBeginEditing: ControlEvent<()> {
        return base.textField.rx.controlEvent(.editingDidBegin)
    }
    
    var textFieldDidEndEditing: ControlEvent<()> {
        return base.textField.rx.controlEvent(.editingDidEnd)
    }
}
