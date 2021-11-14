//
//  AchievementRateCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import RxSwift
import RxCocoa

class AchievementRateCell: CustomDetailCell {
    
    static let cellId = "AchievementRateCellId"
    
    let percentageNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.lastLetterToSmall(value: label.text!)
        return label
    }()
    
    let lastThreeDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "直近三日の"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    let achievementRateLabel: UILabel = {
        let label = UILabel()
        label.text = "チャレンジ達成率"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let achievementRateCircleView = CircleProgressView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let leftStackView = UIStackView(arrangedSubviews: [lastThreeDaysLabel, achievementRateLabel])
        leftStackView.axis = .vertical
        leftStackView.spacing = 5
        
        achievementRateCircleView.constrainWidth(constant: 60)
        let rightStackView = UIStackView(arrangedSubviews: [achievementRateCircleView, percentageNumberLabel])
        
        containerView.addSubview(leftStackView)
        containerView.addSubview(rightStackView)
        leftStackView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 0))
        rightStackView.anchor(top: containerView.topAnchor, leading: leadingAnchor, bottom: containerView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: frame.width * 8.5 / 10, bottom: 0, right: 0))
    }
    
    func bind(to viewModel: AchievementRateCellViewModel) {
        
        viewModel.achievementRate
            .subscribe(onNext: { rate in
                let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
                basicAnimation.toValue = rate
                basicAnimation.duration = rate * self.animationSpeed
                basicAnimation.fillMode = CAMediaTimingFillMode.forwards
                basicAnimation.isRemovedOnCompletion = false
                self.achievementRateCircleView.foregroundLayer.add(basicAnimation, forKey: "urSoBasic")
            }).disposed(by: disposeBag)
        
        viewModel.achievementRate
            .subscribe(onNext: { rate in
                self.rate = rate
                self.countupOnLabel()
            })
            .disposed(by: disposeBag)
    }
    
    
    var animationStartDate: Date = Date()
    var rate: Double = 0
    let animationSpeed = 1.5
    
    private func countupOnLabel() {
        animationStartDate = Date()
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .current, forMode: .common)
    }
    
    @objc func handleUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        let duration = rate * animationSpeed
        
        if elapsedTime > duration {
            let stringEndValue = String(format: "%.0f%", rate * 100) + "%"
            percentageNumberLabel.text = stringEndValue
            percentageNumberLabel.lastLetterToSmall(value: stringEndValue)
        } else {
            let persentage = elapsedTime / duration
            let value = persentage * rate
            let stringValue = String(format: "%.0f%", value * 100) + "%"
            percentageNumberLabel.text = stringValue
            percentageNumberLabel.lastLetterToSmall(value: stringValue)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
