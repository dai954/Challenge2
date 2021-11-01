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
    }
    
    struct Output {
        let tags: Observable<[TagSearchSection]>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        let tagSections = input.viewLayoutEvent
            .flatMap { _ in
                self.resourceAPI.getTagSections()
            }
            .share(replay: 1)
        
        return Output(tags: tagSections)
    }
    
}
