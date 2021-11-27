//
//  BottomAlertCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/30.
//

import RxSwift
import RxCocoa

class ReportButtonCell: CustomDetailCell {
    
    static let cellId = "ReportButtonCellId"
    
    let reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("このチームを通報する", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        let image = UIImage(systemName: "exclamationmark.bubble")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFit
        button.constrainWidth(constant: 120)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = false
        makeUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    private func makeUI() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        containerView.addSubview(reportButton)
        
        reportButton.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 20, right: 0))
    }
    
    func bind(to viewModel: ReportButtonCellViewModel) {
        // hold tap event "until" prepareForReuse method is called.
        let prepareForReuseObservable = self.rx.sentMessage(#selector(UITableViewCell.prepareForReuse))
        let input = ReportButtonCellViewModel.Input(reportButtonTapped: reportButton.rx.tap
                                                        .take(until: prepareForReuseObservable).asSignal(onErrorJustReturn: ()))
        viewModel.wireAction(input: input)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
