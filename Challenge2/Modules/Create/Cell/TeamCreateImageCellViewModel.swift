//
//  TeamCreateImageCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa


class TeamCreateImageCellViewModel {
    let id = UUID().uuidString
    
    let backImageSelection: Driver<UIImage>
    let premireIsHidden: Driver<Bool>
    let beginnerIsHidden: Driver<Bool>
    
    init(backImageSelection: Driver<BackImageResource> ,premiumSwitchIsOn: Driver<Bool> ,beginnerSwitchIsOn: Driver<Bool>) {
        
        self.backImageSelection = backImageSelection.map { $0.backImage }
        self.premireIsHidden = premiumSwitchIsOn.map { !$0 }
        self.beginnerIsHidden = beginnerSwitchIsOn.map { !$0 }
        
    }
}
