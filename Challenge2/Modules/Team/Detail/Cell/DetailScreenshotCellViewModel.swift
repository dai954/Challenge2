//
//  ScreenshotCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxSwift
import RxCocoa

class DetailScreenshotCellViewModel {
    
    let screenshotSections: Driver<[ScreenshotSection]>
    
    init(app: App) {
        let sections = ScreenshotSection(header: "header", items: app.screenshotUrls ?? [])
        self.screenshotSections = Driver.just([sections])
    }
}
