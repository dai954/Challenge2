//
//  TeamDetailSection.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxDataSources

//              DetailCollectionViewCell
//              AchievementRateCell
//              DetailDescriptionCell
//              DetailScreenshotCell
//              DetailInfoCell.self
//              detailInfoCellPlusQButton
//              detailInfoCellPlusICon
//              FavoriteRegisterCell
//              BottomAlertCell

enum TeamSectionItem {
    case teamImage(viewModel: TeamDetailCellViewModel)
    case achievementRate(viewModel: TeamDetailCellViewModel)
    case description(viewModel: TeamDetailCellViewModel)
    case dateInfo(viewModel: TeamDetailCellViewModel)
    case ageInfo(viewModel: TeamDetailCellViewModel)
    case sexInfo(viewModel: TeamDetailCellViewModel)
    case termInfo(viewModel: TeamDetailCellViewModel)
    case autoExitTermInfo(viewModel: TeamDetailCellViewModel)
    case assistantInfo(viewModel: TeamDetailCellViewModel)
    case favorite(viewModel: TeamDetailCellViewModel)
    case report(viewModel: TeamDetailCellViewModel)
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
