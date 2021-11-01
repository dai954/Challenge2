//
//  CategorySearchSections.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/31.
//

import RxDataSources

struct CategorySearchSection {
    var header: String
    var items: [Item]
}

extension CategorySearchSection: SectionModelType {
    typealias Item = CategoryResouce
    
    init(original: CategorySearchSection, items: [Item]) {
        self = original
        self.items = items
    }
}
