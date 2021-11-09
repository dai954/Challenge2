//
//  AchievementRateCircleView.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/07.
//

import UIKit

class CircleProgressView: UIView {
    
    private var backgroundLayer: CAShapeLayer!
    public var foregroundLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    override func draw(_ rect: CGRect) {
        
        let radius: CGFloat = 20
        
        backgroundLayer = createCircularLayer(rect: rect, radius: radius, strokeColor: UIColor.lightGray.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: 4, strokeEnd: 1)
        
        foregroundLayer = createCircularLayer(rect: rect, radius: radius, strokeColor: UIColor.primaryRed().cgColor, fillColor: UIColor.clear.cgColor, lineWidth: 4, strokeEnd: 0)
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(foregroundLayer)

    }
    
    private func createCircularLayer(rect: CGRect, radius: CGFloat, strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat, strokeEnd: CGFloat) -> CAShapeLayer {
        
        let width = rect.width
        let height = rect.height
        
        let center = CGPoint(x: width/2, y: height/2)
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        
        let sharpLayer = CAShapeLayer()
        
        sharpLayer.path = circularPath.cgPath
        
        sharpLayer.strokeEnd = strokeEnd
        sharpLayer.strokeColor = strokeColor
        sharpLayer.fillColor = fillColor
        sharpLayer.lineWidth = lineWidth
        
        return sharpLayer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
