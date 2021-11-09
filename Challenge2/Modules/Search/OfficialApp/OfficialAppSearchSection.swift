//
//  OfficialAppSearchSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxDataSources

struct OfficialAppSearchSection {
    var header: String
    var items: [Item]
}

extension OfficialAppSearchSection: SectionModelType {
    
    typealias Item = FeedContent
    
    init(original: OfficialAppSearchSection, items: [Item]) {
        self = original
        self.items = items
    }
    
    
}
