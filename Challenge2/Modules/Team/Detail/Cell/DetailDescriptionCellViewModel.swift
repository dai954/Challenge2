//
//  DetailDescriptionCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa

class DetailDescriptionCellViewModel {
    
    let app: App
    let description = BehaviorRelay<String?>(value: nil)
    
    init(app: App) {
        self.app = app
        description.accept(app.description)
    }
    
}
