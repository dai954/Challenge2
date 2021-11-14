//
//  ScreenshotSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/10.
//

import RxDataSources

struct ScreenshotSection {
    var header: String
    var items: [Item]
}

extension ScreenshotSection: SectionModelType {

    typealias Item = String
    
    init(original: ScreenshotSection, items: [Item]) {
        self = original
        self.items = items
    }
}
