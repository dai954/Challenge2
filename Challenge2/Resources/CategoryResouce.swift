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
            return #imageLiteral(resourceName: "meow")
        case .weight:
            return #imageLiteral(resourceName: "meow2")
        case .meal:
            return #imageLiteral(resourceName: "meow4")
        case .workout:
            return #imageLiteral(resourceName: "meow5")
        case .walking:
            return #imageLiteral(resourceName: "meow3")
        case .walkingRelay:
            return #imageLiteral(resourceName: "meow2")
        case .diabetes:
            return #imageLiteral(resourceName: "meow")
        case .frail:
            return #imageLiteral(resourceName: "meow2")
        case .running:
            return #imageLiteral(resourceName: "meow4")
        case .getUpEarly:
            return #imageLiteral(resourceName: "meow5")
        case .sleep:
            return #imageLiteral(resourceName: "meow3")
        case .mindfulness:
            return #imageLiteral(resourceName: "meow")
        case .study:
            return #imageLiteral(resourceName: "meow2")
        case .helthcareAndBeauty:
            return #imageLiteral(resourceName: "meow4")
        case .houseworkAndWork:
            return #imageLiteral(resourceName: "meow5")
        case .HobbyAndCreation:
            return #imageLiteral(resourceName: "meow3")
        case .minchalleBiginer:
            return #imageLiteral(resourceName: "meow3")
        }
    }
}
