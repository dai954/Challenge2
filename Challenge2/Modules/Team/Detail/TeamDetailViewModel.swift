//
//  TeamDetailViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift
import RxCocoa

class TeamDetailViewModel: ViewModelType {
    
    struct Input {
        let viewLayoutEvent: Observable<Void>
    }
    
    struct Output {
        let teamDetailSections: Observable<[TeamDetailSection]>
    }
    
    let challengeAPI: ChallengeAPIType!
    
    let appId: BehaviorRelay<Int>

    init(challengeAPI: ChallengeAPIType, appId: Int) {
        self.challengeAPI = challengeAPI
        self.appId = BehaviorRelay(value: appId)
    }
    
//    case teamImage(viewModel: TeamDetailCellViewModel)
//    case achievementRate(viewModel: TeamDetailCellViewModel)
//    case description(viewModel: TeamDetailCellViewModel)
//    case dateInfo(viewModel: TeamDetailCellViewModel)
//    case ageInfo(viewModel: TeamDetailCellViewModel)
//    case sexInfo(viewModel: TeamDetailCellViewModel)
//    case termInfo(viewModel: TeamDetailCellViewModel)
//    case autoExitTermInfo(viewModel: TeamDetailCellViewModel)
//    case assistantInfo(viewModel: TeamDetailCellViewModel)
//    case favorite(viewModel: TeamDetailCellViewModel)
//    case report(viewModel: TeamDetailCellViewModel)
    
    func transform(input: Input) -> Output {
        
        let sections = appId.asObservable()
            .flatMap { appId -> Observable<App>  in
                let app = self.challengeAPI.getTeamDetail(appId: appId)
                return app
            }.map { app -> [TeamDetailSection] in
                var items: [TeamSectionItem] = []
                
                let teamImageCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.teamImage(viewModel: teamImageCellViewModel))
                
                let achievementRateCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.achievementRate(viewModel: achievementRateCellViewModel))
                
                let descripthionCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.description(viewModel: descripthionCellViewModel))
                
                let dateInfoCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.teamImage(viewModel: dateInfoCellViewModel))
                
                let ageInfoCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.achievementRate(viewModel: ageInfoCellViewModel))
                
                let sexInfoCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.description(viewModel: sexInfoCellViewModel))
                
                let termInfoCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.teamImage(viewModel: termInfoCellViewModel))
                
                let autoExitTermCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.achievementRate(viewModel: autoExitTermCellViewModel))
                
                let assistantInfoCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.description(viewModel: assistantInfoCellViewModel))
                
                let favoriteCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.teamImage(viewModel: favoriteCellViewModel))
                
                let reportCellViewModel = TeamDetailCellViewModel(app: app)
                items.append(TeamSectionItem.achievementRate(viewModel: reportCellViewModel))
                
                let sections = TeamDetailSection(header: "header", items: items)
                
                return [sections]
            }
            .share(replay: 1)
            
        
        return Output(teamDetailSections: sections)
    }
}
