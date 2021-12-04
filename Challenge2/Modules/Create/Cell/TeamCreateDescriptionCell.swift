//
//  TeamCreateDescriptionCell.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

protocol descriptionTextViewDelegate: NSObject {
    func descriptionTextViewDidChanged()
}

class TeamCreateDescriptionCell: TeamCreateDefaultCell, UITextViewDelegate {
    
    static let cellId = "TeamCreateDescriptionCellId"
    
    weak var delegate: descriptionTextViewDelegate?
    
    let textView: PlaceHolderTextView = {
        let tView = PlaceHolderTextView()
        tView.isScrollEnabled = false
        tView.font = .systemFont(ofSize: 12)
        tView.backgroundColor = .clear
        tView.placeHolder = "例) みんなで仲良く励まし合いながら、それぞれのペースで目標達成を目指すチームです。"
        tView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        return tView
    }()
    
    let tagTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "おすすめハッシュタグ"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    let descriptionBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let tagControllerBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let recommendTagCollectionViewController = RecommendTagCollectionViewController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        textView.delegate = self
        titleLabel.text = "チームの説明文"
        rightLabel.text = "400文字以内"
        rightLabel.font = .systemFont(ofSize: 12)
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    
        containerViewBottomAnchor.isActive = false
        containerViewBottomAnchor.constant = -10
        containerViewBottomAnchor.isActive = true
        
        let hStackView = UIStackView(arrangedSubviews: [titleLabel, UIView(), rightLabel])
        hStackView.alignment = .bottom

        let vStackView = UIStackView(arrangedSubviews: [hStackView, textView])
        vStackView.axis = .vertical
        
        let overallStackView = UIStackView(arrangedSubviews: [descriptionBackGroundView, tagControllerBackGroundView])
        overallStackView.axis = .vertical
        
        descriptionBackGroundView.addSubview(vStackView)
        tagControllerBackGroundView.addSubview(recommendTagCollectionViewController.view)
        tagControllerBackGroundView.addSubview(tagTitleLabel)
        containerView.addSubview(overallStackView)
        
        recommendTagCollectionViewController.view.constrainHeight(constant: 50)
        
        vStackView.fillSuperview(padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        recommendTagCollectionViewController.view.fillSuperview(padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        tagTitleLabel.anchor(top: tagControllerBackGroundView.topAnchor, leading: recommendTagCollectionViewController.view.leadingAnchor, bottom: recommendTagCollectionViewController.view.topAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        overallStackView.fillSuperview()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.delegate?.descriptionTextViewDidChanged()
    }
    
    func bind(to viewModel: TeamCreateDescriptionCellViewModel) {
        
        viewModel.parentViewTappedTrigger.drive(onNext: { [weak self] in
            print("parentViewTappedTrigger")
            self?.textView.endEditing(false)
        }).disposed(by: disposeBag)
        
        let input = TeamCreateDescriptionCellViewModel.Input(textEditingEvent: textView.rx.text.asDriver().filterNil())
        let output = viewModel.transform(input: input)
        
        output.validatedTextField.drive(rightLabel.rx.textFieldValidationResult).disposed(by: disposeBag)
        output.validatedTextField.drive(descriptionBackGroundView.rx.textFieldValidationResult).disposed(by: disposeBag)
   
        // bind to recommendTagCollectionViewController
//        recommendTagCollectionViewController.collectionView.rx.modelSelected(RecommendedHashTag.self)
//            .subscribe(onNext: { [weak self] recommendedHashTag in
//                self?.textView.insertText(recommendedHashTag.text)
//            }).disposed(by: disposeBag)
        
        recommendTagCollectionViewController.tagButtonTappedRelay.asDriver(onErrorJustReturn: "")
            .drive(onNext: { [weak self] text in
                self?.textView.insertText(text)
            }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Reactive where Base: TeamCreateDescriptionCell {
    
    var textViewDidBeginEditing: ControlEvent<()> {
        return base.textView.rx.didBeginEditing
    }
    
    var textViewDidEndEditing: ControlEvent<()> {
        return base.textView.rx.didEndEditing
    }
}
