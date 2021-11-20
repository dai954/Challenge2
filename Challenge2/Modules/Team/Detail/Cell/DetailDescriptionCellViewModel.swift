//
//  DetailDescriptionCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa

class DetailDescriptionCellViewModel {
    
    let description: Driver<String>
    
    init(app: App) {
        self.description = Driver.just(app.description ?? "")
    }
    
}
