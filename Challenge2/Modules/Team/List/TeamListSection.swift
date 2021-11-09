//
//  TeamListSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/03.
//

import RxDataSources

struct TeamListSection {
    var header: String
    var items: [Item]
}

extension TeamListSection: SectionModelType {
    typealias Item = TeamListCellViewModel
    
    init(original: TeamListSection, items: [Item]) {
        self = original
        self.items = items
    }
}
