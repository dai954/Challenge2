//
//  BackGrounImageSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxDataSources

struct BackGroundImageSection {
    var header: String
    var items: [Item]
}

extension BackGroundImageSection: SectionModelType {
    typealias Item = BackImageResource
    
    init(original: BackGroundImageSection, items: [Item]) {
        self = original
        self.items = items
    }
}
