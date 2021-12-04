//
//  TeamCreateBeginnerCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class TeamCreateBeginnerCellViewModel {
    let id = UUID().uuidString
    
    let beginnerSwitchEnabled: Driver<Bool>
    let beginnerTitleAlpha: Driver<CGFloat>
    
    init(premiumSwitchIsOn: Driver<Bool>) {
        self.beginnerSwitchEnabled = premiumSwitchIsOn.map { !$0 }
        
        self.beginnerTitleAlpha = premiumSwitchIsOn.map { bool in
            if bool {
                return 0.8
            } else {
                return 1
            }
        }
    }
}
