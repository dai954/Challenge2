//
//  TeamDetailSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxDataSources

enum TeamSectionItem {
    case teamImage(viewModel: TeamDetailImageCellViewModel)
    case achievementRate(viewModel: AchievementRateCellViewModel)
    case description(viewModel: DetailDescriptionCellViewModel)
    case screenshots(viewModel: DetailScreenshotCellViewModel)
    case dateInfo(viewModel: DetailInfoCellViewModel)
    case ageInfo(viewModel: DetailInfoCellViewModel)
    case sexInfo(viewModel: DetailInfoCellViewModel)
    case termInfo(viewModel: DetailInfoCellViewModel)
    case autoExitTermInfo(viewModel: DetailInfoCellViewModel)
    case assistantInfo(viewModel: DetailInfoCellViewModel)
    case favorite(viewModel: FavoriteRegisterCellViewModel)
    case report(viewModel: ReportButtonCellViewModel)
}

struct TeamDetailSection {
    var header: String
    var items: [Item]
}

extension TeamDetailSection: SectionModelType {
    
    typealias Item = TeamSectionItem
 
    init(original: TeamDetailSection, items: [Item]) {
        self = original
        self.items = items
    }
}

//struct TeamListSection {
//    var header: String
//    var items: [Item]
//}
//
//extension TeamListSection: SectionModelType {
//    typealias Item = TeamListCellViewModel
//
//    init(original: TeamListSection, items: [Item]) {
//        self = original
//        self.items = items
//    }
//}
