//
//  TeamDetailViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift
import RxCocoa

class TeamDetailViewModel: ViewModelType {
    
    deinit {
        print("TeamDetailViewModel deinit")
    }
    
    struct Input {
        let willDisplayCellEvent: Driver<WillDisplayCellEvent>
    }
    
    struct Output {
        let teamDetailSections: Driver<[TeamDetailSection]>
    }
    
    let app: Driver<App>

    init(app: App) {
        print("TeamDetailViewModel init")
        self.app = Driver.just(app)
    }
    
    
    func transform(input: Input) -> Output {
        
        let sections = app
            .map { app -> [TeamDetailSection] in
                var items: [TeamSectionItem] = []
                let willDisplayRatingCell = input.willDisplayCellEvent
                    .filter { $1.item == 1 }
                
                let teamImageCellViewModel = TeamDetailImageCellViewModel(app: app)
                items.append(TeamSectionItem.teamImage(viewModel: teamImageCellViewModel))
                
                let achievementRateCellViewModel = AchievementRateCellViewModel(app: app ,willDisplayCellEvent: willDisplayRatingCell)
                items.append(TeamSectionItem.achievementRate(viewModel: achievementRateCellViewModel))
                
                let descripthionCellViewModel = DetailDescriptionCellViewModel(app: app)
                items.append(TeamSectionItem.description(viewModel: descripthionCellViewModel))
                
                let screenShotCellViewModel = DetailScreenshotCellViewModel(app: app)
                items.append(TeamSectionItem.screenshots(viewModel: screenShotCellViewModel))
                
                let dateInfoCellViewModel = DetailInfoCellViewModel(app: app, detail: .lastUpdate)
                items.append(TeamSectionItem.dateInfo(viewModel: dateInfoCellViewModel))
                
                let ageInfoCellViewModel = DetailInfoCellViewModel(app: app, detail: .ageRestrict)
                items.append(TeamSectionItem.ageInfo(viewModel: ageInfoCellViewModel))
                
                let sexInfoCellViewModel = DetailInfoCellViewModel(app: app, detail: .genderRistrict)
                items.append(TeamSectionItem.sexInfo(viewModel: sexInfoCellViewModel))
                
                let termInfoCellViewModel = DetailInfoCellViewModel(app: app, detail: .challengeTerm)
                items.append(TeamSectionItem.termInfo(viewModel: termInfoCellViewModel))
                
                let autoExitTermCellViewModel = DetailInfoCellViewModel(app: app, detail: .autoExitTerm)
                items.append(TeamSectionItem.autoExitTermInfo(viewModel: autoExitTermCellViewModel))
                
                let assistantInfoCellViewModel = DetailInfoCellViewModel(app: app, detail: .assistantColor)
                items.append(TeamSectionItem.assistantInfo(viewModel: assistantInfoCellViewModel))
                
                let favoriteCellViewModel = FavoriteRegisterCellViewModel()
                items.append(TeamSectionItem.favorite(viewModel: favoriteCellViewModel))
                
                let reportCellViewModel = ReportButtonCellViewModel()
                items.append(TeamSectionItem.report(viewModel: reportCellViewModel))
                
                let sections = TeamDetailSection(header: "header", items: items)
                
                return [sections]
            }
        
        return Output(teamDetailSections: sections)
    }
}
