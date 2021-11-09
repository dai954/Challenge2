//
//  TeamDetailCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift
import RxCocoa

class TeamDetailCellViewModel {
    
    let app: App
    
    let title = BehaviorRelay<String?>(value: nil)
    let imageUrl = BehaviorRelay<String?>(value: nil)
    let description = BehaviorRelay<String?>(value: nil)
    
    init(app: App) {
        self.app = app
        title.accept(app.trackName)
        imageUrl.accept(app.artworkUrl100)
        description.accept(app.description)
    }
}
