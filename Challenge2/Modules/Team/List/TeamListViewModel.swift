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
        var viewLayoutEvent: Observable<Void>
    }
    
    struct Output {
        var viewModelSections: Observable<[TeamListSection]>
    }
    
    let challengeAPI: ChallengeAPIType!
    
    let keyword: BehaviorRelay<String>

    init(challengeAPI: ChallengeAPIType, keyword: String) {
        self.challengeAPI = challengeAPI
        self.keyword = BehaviorRelay(value: keyword)
    }
    
    func transform(input: Input) -> Output {
        
        let sections = keyword.asObservable()
            .flatMap { string -> Observable<[TeamListSection]> in
                self.challengeAPI.getTeamListSections(keyword: string)
            }.share(replay: 1)
        
        return Output(viewModelSections: sections)
    }
}
