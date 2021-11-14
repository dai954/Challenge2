//
//  TagSearchViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/01.
//

import RxSwift
import RxCocoa

class TagSearchViewModel: ViewModelType {
    
    struct Input {
        let viewLayoutEvent: Observable<Void>
        let selection: Observable<String>
        let searchWord: Observable<String>
        let searchButtonClick: Observable<Void>
    }
    
    struct Output {
        let tags: Observable<[TagSearchSection]>
        let searchInvoked: Observable<TeamListViewModel>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        
        // Display tag
        let tagSections = input.viewLayoutEvent
            .flatMap { _ in
                self.resourceAPI.getTagSections()
            }
            .share(replay: 1)
        
        // Search with textField and tag
        let buttonClickedWithText = input.searchButtonClick.withLatestFrom(input.searchWord)
        let searchInvoked = Observable.of(input.selection, buttonClickedWithText).merge()
            .map { text in
                TeamListViewModel(challengeAPI: ChallengeAPI.challengeAPIShared, keyword: text)
            }
            .share(replay: 1)
        
        return Output(tags: tagSections, searchInvoked: searchInvoked)
    }
    
}
