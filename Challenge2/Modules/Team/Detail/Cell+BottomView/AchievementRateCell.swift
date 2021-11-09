//
//  AchievementRateCell.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/29.
//

import UIKit

class AchievementRateCell: CustomDetailCell {
    
    static let cellId = "AchievementRateCellId"
    
    let rate: Double = 5
    
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
//        backgroundColor = .gray
        
        // ↓↓↓↓↓ going to delete
        contentView.isUserInteractionEnabled = false
        achievementRateCircleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        
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
    
    @objc private func handleTap() {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        let ratePercentage = rate / 5
        basicAnimation.toValue = ratePercentage
        
        animationDuration = rate / 5
        basicAnimation.duration = animationDuration
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false

        achievementRateCircleView.foregroundLayer.add(basicAnimation, forKey: "urSoBasic")
   
        countupOnLabel()
    }
    
    var startValue: Double = 0
    var endValue: Double = 100
    var animationDuration: Double = 1.0
    var animationStartDate: Date = Date()
    
    private func countupOnLabel() {
        
        animationStartDate = Date()
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
    }
    
    @objc func handleUpdate() {
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        endValue = rate / 5
        
        if elapsedTime > animationDuration {
            let stringEndValue = String(format: "%.0f%", endValue * 100) + "%"
            percentageNumberLabel.text = stringEndValue
            percentageNumberLabel.lastLetterToSmall(value: stringEndValue)
        } else {
            let persentage = elapsedTime / animationDuration
            let value = persentage * (endValue - startValue)
            let stringValue = String(format: "%.0f%", value * 100) + "%"
            percentageNumberLabel.text = stringValue
            percentageNumberLabel.lastLetterToSmall(value: stringValue)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
