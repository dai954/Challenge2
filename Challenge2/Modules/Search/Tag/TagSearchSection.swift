//
//  TagSearchSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/01.
//

import RxDataSources

struct TagSearchSection {
    var header: String
    var items: [Item]
}

extension TagSearchSection: SectionModelType {
   
    typealias Item = String
    
    init(original: TagSearchSection, items: [Item]) {
        self = original
        self.items = items
    }
    
}
