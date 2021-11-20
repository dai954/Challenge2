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
        let viewWillAppearEvent: Signal<()>
        let selection: Driver<CategoryResouce>
    }
    
    struct Output {
        let categories: Driver<[CategorySearchSection]>
        let categorySelected: Driver<TeamListViewModel>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        
        let categorySections = input.viewWillAppearEvent
            .flatMap { _ -> Driver<[CategorySearchSection]> in
                self.resourceAPI.getCategorySections()
                    .asDriver(onErrorJustReturn: [])
            }
        
        let categorySelected = input.selection
            .map { categoryResouce in
                TeamListViewModel(challengeAPI: ChallengeAPI.challengeAPIShared, keyword: categoryResouce.title)
            }
        
        return Output(categories: categorySections, categorySelected: categorySelected)
    }
}
