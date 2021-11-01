//
//  TagResource.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import Foundation

enum TagResource: Int, CaseIterable {
    
    case recommend, study, diet, work, hobby
    
    var title: String {
        switch self {
        case .recommend:
            return "オススメ"
        case .study:
            return "勉強"
        case .diet:
            return "ダイエット"
        case .work:
            return "家事/仕事"
        case .hobby:
            return "趣味/創作"
        }
    }
    
    var tags: Array<String> {
        switch self {
        case .recommend:
            return TagResource.Recommend.allCases.map { tag in
                tag.tagTitle
            }
        case .study:
            return TagResource.Study.allCases.map { tag in
                tag.tagTitle
            }
        case .diet:
            return  TagResource.Diet.allCases.map { tag in
                tag.tagTitle
            }
        case .work:
            return TagResource.Work.allCases.map { tag in
                tag.tagTitle
            }
        case .hobby:
            return TagResource.Hobby.allCases.map { tag in
                tag.tagTitle
            }
        }
        
    }
    
    
    enum Recommend:Int, CaseIterable {
        case year, season, youtube, decluttering, post, myPace, conversation ,getUpEarly
        
        var tagTitle: String {
            switch self {
            case .year:
                return "2021"
            case .season:
                return "秋"
            case .youtube:
                return "youtube"
            case .decluttering:
                return "断捨離"
            case .post:
                return "毎日投稿"
            case .myPace:
                return "マイペース"
            case .conversation:
                return "楽しく会話"
            case .getUpEarly:
                return "早起き"
            }
        }
    }
    
    enum Study: Int, CaseIterable {
        case english, toeic, listening, chinese, korean, german, spanish, french, lunguage, programing, certification, exam
        
        var tagTitle: String {
            switch self {
            case .english:
                return "英語"
            case .toeic:
                return "TOEIC"
            case .listening:
                return "リスニング"
            case .chinese:
                return "中国語"
            case .korean:
                return "韓国語"
            case .german:
                return "ドイツ語"
            case .spanish:
                return "スペイン語"
            case .french:
                return "フランス語"
            case .lunguage:
                return "語学学習"
            case .programing:
                return "プログラミング"
            case .certification:
                return "資格"
            case .exam:
                return "受験勉強"
            }
        }
    }
    
    enum Diet: Int, CaseIterable {
        case loseWeight, standardWeight, fat, abdominal, bodymaking, stretch, yoga, workOut, fourtyKg, fiftyKg, sixtyKg, seventyKg, eightyKg
        
        var tagTitle: String {
            switch self {
            case .loseWeight:
                return "減量"
            case .standardWeight:
                return "標準体重"
            case .fat:
                return "体脂肪"
            case .abdominal:
                return "腹筋"
            case .bodymaking:
                return "ボディメイク"
            case .stretch:
                return "ストレッチ"
            case .yoga:
                return "ヨガ"
            case .workOut:
                return "筋トレ"
            case .fourtyKg:
                return "40kg"
            case .fiftyKg:
                return "50kg"
            case .sixtyKg:
                return "60kg"
            case .seventyKg:
                return "70kg"
            case .eightyKg:
                return "80kg"
            }
        }
    }
    
    enum Work: Int, CaseIterable {
        case cleaning, cooking, childRaising, saving, todo, invest, morningActivity
        
        var tagTitle: String {
            switch self {
            case .cleaning:
                return "掃除"
            case .cooking:
                return "料理"
            case .childRaising:
                return "子育て"
            case .saving:
                return "貯金"
            case .todo:
                return "TODO"
            case .invest:
                return "投資"
            case .morningActivity:
                return "朝活"
            }
        }
    }
    
    enum Hobby: Int, CaseIterable {
        case paint, reading, game, blog, music, writing
        
        var tagTitle: String {
            switch self {
            case .paint:
                return "絵"
            case .reading:
                return "読書"
            case .game:
                return "ゲーム"
            case .blog:
                return "ブログ"
            case .music:
                return "音楽"
            case .writing:
                return "執筆"
            }
        }
    }
}
