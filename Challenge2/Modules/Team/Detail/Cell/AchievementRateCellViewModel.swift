//
//  AchievementRateCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa


class AchievementRateCellViewModel {

    let achievementRate: Observable<Double>
    let achievementRateLabel = BehaviorRelay<String?>(value: nil)
    
    init(app: App, willDisplayObservable: Observable<WillDisplayCellEvent>) {
        
        achievementRate = willDisplayObservable
            .map { _ -> Double in
                let averageUsersRating = app.averageUserRating ?? 0
                return Double(averageUsersRating / 5)
            }
            .share(replay: 1)
        
    }
    
}

