//
//  OfficialAppViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import RxSwift
import RxCocoa

class OfficialAppViewModel: ViewModelType {
    
    struct Input {
        let viewWillAppearEvent: Signal<()>
    }
    
    struct Output {
        let officialAppSearchSections: Driver<[OfficialAppSearchSection]>
    }
    
    let resourceAPI: ResourceFeedAPIType!
    
    init(resourceAPI: ResourceFeedAPIType) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        
        let sections = input.viewWillAppearEvent
            .flatMap { _ in
                    self.resourceAPI.getFeedResult()
                        .asDriver(onErrorJustReturn: nil)
            }
            .map { feedResult in
                [OfficialAppSearchSection(header: "header", items: feedResult?.feed.results ?? [])]
            }
        
        return Output(officialAppSearchSections: sections)
    }
}
