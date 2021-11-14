//
//  CategoryResouce.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

enum CategoryResouce: Int, CaseIterable {
    case appleWatch, weight, meal, workout, walking, walkingRelay, diabetes, frail, running, getUpEarly, sleep, mindfulness, study, helthcareAndBeauty, houseworkAndWork, HobbyAndCreation, minchalleBiginer
    
    var title: String {
        switch self {
        case .appleWatch:
            return "Apple Watch"
        case .weight:
            return "体重管理"
        case .meal:
            return "食事記録"
        case .workout:
            return "トレーニング"
        case .walking:
            return "歩く"
        case .walkingRelay:
            return "ウォーキングリレー"
        case .diabetes:
            return "糖尿病改善"
        case .frail:
            return "フレイル予防"
        case .running:
            return "ランニング"
        case .getUpEarly:
            return "早起き"
        case .sleep:
            return "睡眠をとる"
        case .mindfulness:
            return "マインドフルネス"
        case .study:
            return "勉強"
        case .helthcareAndBeauty:
            return "健康・美容"
        case .houseworkAndWork:
            return "家事・仕事"
        case .HobbyAndCreation:
            return "趣味・創作"
        case .minchalleBiginer:
            return "みんチャレ初心者"
        }
    }
    
    var image: UIImage {
        switch self {
        case .appleWatch:
            return #imageLiteral(resourceName: "cat1")
        case .weight:
            return #imageLiteral(resourceName: "cat3")
        case .meal:
            return #imageLiteral(resourceName: "cat7")
        case .workout:
            return #imageLiteral(resourceName: "cat4")
        case .walking:
            return #imageLiteral(resourceName: "cat6")
        case .walkingRelay:
            return #imageLiteral(resourceName: "cat10")
        case .diabetes:
            return #imageLiteral(resourceName: "cat5")
        case .frail:
            return #imageLiteral(resourceName: "cat7")
        case .running:
            return #imageLiteral(resourceName: "cat3")
        case .getUpEarly:
            return #imageLiteral(resourceName: "cat6")
        case .sleep:
            return #imageLiteral(resourceName: "cat4")
        case .mindfulness:
            return #imageLiteral(resourceName: "cat5")
        case .study:
            return #imageLiteral(resourceName: "cat3")
        case .helthcareAndBeauty:
            return #imageLiteral(resourceName: "cat10")
        case .houseworkAndWork:
            return #imageLiteral(resourceName: "cat6")
        case .HobbyAndCreation:
            return #imageLiteral(resourceName: "cat9")
        case .minchalleBiginer:
            return #imageLiteral(resourceName: "cat7")
        }
    }
}
