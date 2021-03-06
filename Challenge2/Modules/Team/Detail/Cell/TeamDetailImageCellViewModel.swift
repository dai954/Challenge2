//
//  TeamImageDetailCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa

class TeamDetailImageCellViewModel: CustomTableViewCellViewModel {
    let app: App
    
    init(app: App) {
        self.app = app
        super.init()
        
        title.accept(app.trackName)
        imageUrl.accept(app.artworkUrl100)
        
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
        
        //        Mock data
        if app.screenshotUrls?.count ?? 0 >= 5 {
            isFullHidden = Driver.just(false)
            isPremireHidden = Driver.just(true)
            isBignnerHidden = Driver.just(true)
        } else if app.screenshotUrls?.count ?? 0 == 4 {
            isFullHidden = Driver.just(true)
            isPremireHidden = Driver.just(false)
            isBignnerHidden = Driver.just(true)
        } else if app.screenshotUrls?.count ?? 0 == 3 {
            isFullHidden = Driver.just(true)
            isPremireHidden = Driver.just(true)
            isBignnerHidden = Driver.just(false)
        } else {
            isFullHidden = Driver.just(true)
            isPremireHidden = Driver.just(true)
            isBignnerHidden = Driver.just(true)
        }
        
    }
}
