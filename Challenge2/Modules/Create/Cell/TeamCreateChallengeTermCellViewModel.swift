//
//  TeamCreate.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class TeamCreateChallengeTermCellViewModel {
    let id = UUID().uuidString
    
    let textSelection: Driver<String>
    
    init(textSelection: Driver<[String]>) {
        
        self.textSelection = textSelection.map { $0[0] }
        
    }
    
}
