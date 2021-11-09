//
//  TeamListCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/03.
//

import RxSwift
import RxCocoa

class TeamListCellViewModel {
    
    let app: App
    
    let title = BehaviorRelay<String?>(value: nil)
    let imageUrl = BehaviorRelay<String?>(value: nil)
    let description = BehaviorRelay<String?>(value: nil)
    let avatarImage1 = BehaviorRelay<String?>(value: nil)
    let avatarImage2 = BehaviorRelay<String?>(value: nil)
    let avatarImage3 = BehaviorRelay<String?>(value: nil)
    let avatarImage4 = BehaviorRelay<String?>(value: nil)
    let avatarImage5 = BehaviorRelay<String?>(value: nil)
    
    init(app: App) {
        self.app = app
        title.accept(app.trackName)
        imageUrl.accept(app.artworkUrl100)
        description.accept(app.description)
        
        if let screenshotUrls = app.screenshotUrls {
            if screenshotUrls.count != 0 {
            avatarImage1.accept(screenshotUrls[0])
            if screenshotUrls.count > 1 {
                avatarImage2.accept(screenshotUrls[1])
            }
            if screenshotUrls.count > 2 {
                avatarImage3.accept(screenshotUrls[2])
            }
            if screenshotUrls.count > 3 {
                avatarImage4.accept(screenshotUrls[3])
            }
            if screenshotUrls.count > 4 {
                avatarImage5.accept(screenshotUrls[4])
            }
        }
      }
    }
}
