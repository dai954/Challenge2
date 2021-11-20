//
//  CustomTableViewCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa

class CustomTableViewCellViewModel {
    
    let title = BehaviorRelay<String?>(value: nil)
    let imageUrl = BehaviorRelay<String?>(value: nil)
    let description = BehaviorRelay<String?>(value: nil)
    let avatarImage1 = BehaviorRelay<String?>(value: nil)
    let avatarImage2 = BehaviorRelay<String?>(value: nil)
    let avatarImage3 = BehaviorRelay<String?>(value: nil)
    let avatarImage4 = BehaviorRelay<String?>(value: nil)
    let avatarImage5 = BehaviorRelay<String?>(value: nil)
    
    var isPremireHidden: Driver<Bool>?
    var isBignnerHidden: Driver<Bool>?
    var isFullHidden: Driver<Bool>?
   
}
