//
//  TagSearchViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/01.
//

import RxSwift
import RxCocoa

class TagSearchViewModel: ViewModelType {
    
    deinit {
        print("TagSearchViewModel deinit")
    }
    
    struct Input {
        let viewLWillAppearEvent: Signal<()>
        let selection: Driver<String>
        let searchWord: Driver<String>
        let searchButtonClicked: Signal<()>
    }
    
    struct Output {
        let tags: Driver<[TagSearchSection]>
        let searchInvoked: Driver<TeamListViewModel>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        print("TagSearchViewModel init")
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        
        // Display tag
        let tagSections = input.viewLWillAppearEvent
            .flatMap { _ in
                self.resourceAPI.getTagSections()
                    .asDriver(onErrorJustReturn: [])
            }
        
        // Search with textField and tag
        let buttonClickedWithText = input.searchButtonClicked.withLatestFrom(input.searchWord).asDriver(onErrorJustReturn: "")
        let searchInvoked = Driver.of(input.selection, buttonClickedWithText).merge()
            .map { text in
                TeamListViewModel(challengeAPI: ChallengeAPI.challengeAPIShared, keyword: text)
            }
        
        return Output(tags: tagSections, searchInvoked: searchInvoked)
    }
    
}
