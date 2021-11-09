//
//  FloatingViewScrollDownDemo.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

//import UIKit
//
//class FloatingViewScrollDownDemo: UIViewController, UIScrollViewDelegate {
//    static let floatingViewHeight: CGFloat = 42
//
//    let dummyFloatingView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()
//
//    var firstPosition: CGFloat = 0
//    var flag = true
//    var turnAroundPoint1: CGFloat = 0
//    var turnAroundPoint2: CGFloat = 0
//    var flag2 = true
//    var flag3 = true
//    var lastMovingPoint: CGFloat = 0
//
//    if flag {
//        firstPosition = scrollView.contentOffset.y
//        flag = false
//    }
//
//    let isScrollingDown = isScrollDown(scrollView: scrollView)
//
//    var moving = firstPosition - scrollView.contentOffset.y
//
//    if moving < -30 {
//        if !isScrollingDown {
//            if flag2 {
//                turnAroundPoint1 = scrollView.contentOffset.y
//                flag2 = false
//            }
//            moving = lastMovingPoint + (turnAroundPoint1 - scrollView.contentOffset.y)
//            flag3 = true
//            turnAroundPoint2 = 0
//
//            if moving > 0 {
//                moving = 0
//            }
//        } else {
//            if flag3 {
//                turnAroundPoint2 = scrollView.contentOffset.y
//                flag3 = false
//            }
//            moving = lastMovingPoint - (scrollView.contentOffset.y - turnAroundPoint2)
//            flag2 = true
//            turnAroundPoint1 = 0
//
//            if moving < -42 {
//                moving = -42
//            }
//        }
//
//        lastMovingPoint = moving
//
//        dummyFloatingView.transform = .init(translationX: 0, y: moving)
//
//    }
//
//
//    private func isScrollDown (scrollView: UIScrollView) -> Bool {
//        let currentPosition = scrollView.contentOffset.y
//
//        if lastPosition <= currentPosition {
//            lastPosition = currentPosition
//            return true
//        } else {
//            lastPosition = currentPosition
//            return false
//        }
//    }
//
//}
