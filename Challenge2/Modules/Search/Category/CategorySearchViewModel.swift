//
//  CategorySearchViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/31.
//

import RxSwift
import RxCocoa

class CategorySearchViewModel: ViewModelType {
    
    struct Input {
        let viewLayoutEvent: Observable<Void>
        let selection: Observable<CategoryResouce>
    }
    
    struct Output {
        let categories: Observable<[CategorySearchSection]>
        let categorySelected: Observable<TeamListViewModel>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        let categorySections = input.viewLayoutEvent
            .flatMap { _ in
                self.resourceAPI.getCategorySections()
            }.share(replay: 1)
        
        let categorySelected = input.selection
            .map { categoryResouce in
                TeamListViewModel(challengeAPI: ChallengeAPI.challengeAPIShared, keyword: categoryResouce.title)
            }.share(replay: 1)
        
        return Output(categories: categorySections, categorySelected: categorySelected)
    }
}
