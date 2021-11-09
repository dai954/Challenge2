//
//  OfficialAppSearchViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift
import RxCocoa

class OfficialAppSearchViewModel: ViewModelType {
    
    struct Input {
        let viewLayoutEvent: Observable<Void>
    }
    
    struct Output {
        let officialAppSearchSections: Observable<[OfficialAppSearchSection]>
    }
    
    let resourceAPI: ResourceFeedAPIType!
    
    init(resourceAPI: ResourceFeedAPIType) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        
        let sections = input.viewLayoutEvent
            .flatMap { _ in
                    self.resourceAPI.getFeedResult()
            }
            .map { feedResult in
                [OfficialAppSearchSection(header: "header", items: feedResult.feed.results)]
            }.share(replay: 1)
        
        return Output(officialAppSearchSections: sections)
    }
}
