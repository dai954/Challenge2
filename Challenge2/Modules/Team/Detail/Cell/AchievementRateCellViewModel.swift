//
//  AchievementRateCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa


class AchievementRateCellViewModel {

    let achievementRate: Driver<Double>
    
    init(app: App, willDisplayCellEvent: Driver<WillDisplayCellEvent>) {
        let app = Driver.just(app)
        
        achievementRate = willDisplayCellEvent.withLatestFrom(app)
            .map { app -> Double in
                let averageUsersRating = app.averageUserRating ?? 0
                return Double(averageUsersRating / 5)
            }
        
    }
    
}

