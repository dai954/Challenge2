//
//  TeamDetailInfoResource.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/11.
//

import UIKit

enum DetailInfo {
    case lastUpdate, genderRistrict, ageRestrict,challengeTerm,autoExitTerm, assistantColor
    
    var title: String {
        switch self {
        case .lastUpdate: return "最終更新"
        case .ageRestrict: return "年齢制限"
        case .genderRistrict: return "性別制限"
        case .challengeTerm: return "チャレンジ期間"
        case .autoExitTerm: return "自動退出期間"
        case .assistantColor: return "アシスタント"
        }
    }
    
    var isQuestionLabelHidden: Bool {
        switch self {
        case .lastUpdate: return true
        case .ageRestrict: return false
        case .genderRistrict: return false
        case .challengeTerm: return false
        case .autoExitTerm: return false
        case .assistantColor: return false
        }
    }
    
    var isAssinstantIconHidden: Bool {
        switch self {
        case .lastUpdate: return true
        case .ageRestrict: return true
        case .genderRistrict: return true
        case .challengeTerm: return true
        case .autoExitTerm: return true
        case .assistantColor: return false
        }
    }
    
    var description: String {
        switch self {
        case .lastUpdate: return ""
        case .ageRestrict: return "チームに参加できるユーザーの条件です。オーナーのみ変更できます。"
        case .genderRistrict: return "チームに参加できるユーザーの条件です。オーナーのみ変更できます。"
        case .challengeTerm: return "期間が終わるタイミングで、終了するか継続するかを聞かれます。継続を選ぶかどちらも選択しないとチームに残り、次の期間に延長されます。"
        case .autoExitTerm: return "2日間行動がないメンバーはシステムにより自動的に退出させられます。オーナーのみ変更できます。"
        case .assistantColor:
            return "チャットに参加するアシスタントです。"
        }
    }
}

enum GenderRestrict {
    case male, female, no
    var text: String {
        switch self {
        case .male: return "男性"
        case .female: return "女性"
        case .no: return "制限なし"
        }
    }
}

enum AgeRestrict {
    case ten, twenty, thirty, fourty, fifty, sixty, no
    var text: String {
        switch self {
        case .ten: return "10代"
        case .twenty: return "20代"
        case .thirty: return "30代"
        case .fourty: return "40代"
        case .fifty: return "50代"
        case .sixty: return "60代"
        case .no: return "制限なし"
        }
    }
}

enum challengeTerm {
    case seven, twenty, ninety
    var text: String {
        switch self {
        case .seven: return "残り7日間"
        case .twenty: return "残り20日間"
        case .ninety: return "残り90日間"
        }
    }
}

enum AutoExitTerm {
    case two, four, eight, fifteen
    var text: String {
        switch self {
        case .two: return "2日間"
        case .four: return "4日間"
        case .eight: return "8日間"
        case .fifteen: return "15日間"
        }
    }
}

enum AssistantColor {
    case red, blue, green, yellow, pink, black, no
    var text: String {
        switch self {
        case .red: return "レッド"
        case .blue: return "ブルー"
        case .green: return "グリーン"
        case .yellow: return "イエロー"
        case .pink: return "ピンク"
        case .black: return "ブラック"
        case .no: return "なし"
        }
    }

    var image: UIImage? {
        switch self {
        case .red: return #imageLiteral(resourceName: "cat4")
        case .blue: return #imageLiteral(resourceName: "cat5")
        case .green: return #imageLiteral(resourceName: "cat9")
        case .yellow: return #imageLiteral(resourceName: "cat1")
        case .pink: return #imageLiteral(resourceName: "cat10")
        case .black: return #imageLiteral(resourceName: "cat8")
        case .no: return nil
        }
    }
    
    var description: String {
        switch self {
        case .red: return "レッドは、チャレンジが成功できるように、熱く盛り上げます。"
        case .blue: return "ブルーは、毎日計画どおりに習慣化できるように、しっかりアシストします。"
        case .green: return "グリーンは、マイペースに挑戦できるように、のんびりアシストします。"
        case .yellow: return "イエローは、楽しくチャレンジできるように、元気にアシストします。"
        case .pink: return "ピンクは、チャレンジを頑張る人を応援してくれます。"
        case .black: return "ブラックはチャレンジするのをひたすら邪魔します。"
        case .no: return "表示しないようにします。"
        }
}
    
}


enum TeamWelcome {
    case biginner, full, premire, no
    
    var title: String {
        switch self {
        case .biginner: return "初心者歓迎"
        case .full: return  "満員"
        case .premire: return ""
        case .no: return ""
        }
    }
}
