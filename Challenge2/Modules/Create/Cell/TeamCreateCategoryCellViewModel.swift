//
//  TeamCategoryCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class TeamCreateCategoryCellViewModel {
    let id = UUID().uuidString
    
    let categoryCellTapped: Driver<String>
    
    init(categoryCellTapped: Driver<String>) {
        self.categoryCellTapped = categoryCellTapped
    }
    
}
