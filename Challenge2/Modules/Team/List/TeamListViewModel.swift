//
//  TeamListViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/03.
//

import Foundation
import RxSwift
import RxCocoa

class TeamListViewModel: ViewModelType {
    
    struct Input {
        let viewLayoutEvent: Observable<Void>
        let selection: Observable<TeamListCellViewModel>
        let refreshControlEvent: Observable<Void>
    }
    
    struct Output {
        let viewModelSections: Observable<[TeamListSection]>
        let teamSelected: Observable<TeamDetailViewModel>
        let refreshing: Observable<Bool>
        let numberOfTeam: Observable<String>
    }
    
    let challengeAPI: ChallengeAPIType!
    let keyword: BehaviorRelay<String>
    
    init(challengeAPI: ChallengeAPIType, keyword: String) {
        self.challengeAPI = challengeAPI
        self.keyword = BehaviorRelay(value: keyword)
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let refreshingIndicator = activityIndicator.asObservable()
        
        let sectionsAtFirst = keyword
            .flatMap { keyword in
                return self.challengeAPI.getTeamList(keyword: keyword)
            }
            .catch { error in
                if error is ChallengeClientError {
                    print("ChallengeClientError: \(error)")
                } else {
                    print("ConnectionError: \(error)")
                }
                return Observable.just([])
            }
            .map { apps -> [TeamListSection] in
                let teamListCellViewModels = apps.map { app in
                    return TeamListCellViewModel(app: app)
                }
                let teamListSection = TeamListSection(header: "header", items: teamListCellViewModels)
                return [teamListSection]
            }.share(replay: 1)
        
        let sectionsByRefresh = input.refreshControlEvent.withLatestFrom(keyword)
            .flatMap { keyword in
                return self.challengeAPI.getTeamList(keyword: keyword)
                    .trackActivity(activityIndicator)
            }
            .catch { error in
                if error is ChallengeClientError {
                    print("ChallengeClientError: \(error)")
                } else {
                    print("unexpectedError: \(error)")
                }
                return Observable.just([])
            }
            .map { apps -> [TeamListSection] in
                let teamListCellViewModels = apps.map { app in
                    return TeamListCellViewModel(app: app)
                }
                let teamListSection = TeamListSection(header: "header", items: teamListCellViewModels)
                return [teamListSection]
            }.share(replay: 1)
        
        let sections = Observable.of(sectionsAtFirst, sectionsByRefresh).merge()
        
        let teamSelected = input.selection
            .map { teamListCellViewModel -> TeamDetailViewModel in
                let teamDetailViewModel = TeamDetailViewModel(app: teamListCellViewModel.app)
                return teamDetailViewModel
            }.share(replay: 1)
        
        let numberOfTeam = sections
            .map { sections in
                "\(sections[0].items.count)チーム募集"
            }.share(replay: 1)
        
        return Output(viewModelSections: sections, teamSelected: teamSelected, refreshing: refreshingIndicator, numberOfTeam: numberOfTeam)
    }
}
