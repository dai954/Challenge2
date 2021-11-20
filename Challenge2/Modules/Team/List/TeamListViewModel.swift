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
    
    deinit {
        print("TeamListViewModel deinit !!")
    }
    
    
    struct Input {
        let selection: Driver<TeamListCellViewModel>
        let refreshControlEvent: Observable<Void>
    }
    
    struct Output {
        let viewModelSections: Driver<[TeamListSection]>
        let teamSelected: Driver<TeamDetailViewModel>
        let refreshing: Driver<Bool>
        let numberOfTeam: Driver<String>
    }
    
    let challengeAPI: ChallengeAPIType!
    var keyword = BehaviorRelay<String>(value: "")
    
    init(challengeAPI: ChallengeAPIType, keyword: String) {
        print("TeamListViewModel init")
        self.challengeAPI = challengeAPI
        self.keyword = BehaviorRelay(value: keyword)
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let refreshingIndicator = activityIndicator.asDriver()
        
        let sectionsAtFirst = keyword
            .flatMap { keyword in
                return self.challengeAPI.getTeamList(keyword: keyword )
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
        
        let sections = Observable.of(sectionsAtFirst, sectionsByRefresh).merge().asDriver(onErrorJustReturn: [])
        
        let teamSelected = input.selection
            .map { teamListCellViewModel -> TeamDetailViewModel in
                let teamDetailViewModel = TeamDetailViewModel(app: teamListCellViewModel.app)
                return teamDetailViewModel
            }
        
        let numberOfTeam = sections
            .map { sections in
                "\(sections[0].items.count)チーム募集"
            }
        
        return Output(viewModelSections: sections, teamSelected: teamSelected, refreshing: refreshingIndicator, numberOfTeam: numberOfTeam)
    }
}
