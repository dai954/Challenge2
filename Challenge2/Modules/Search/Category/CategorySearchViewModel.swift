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
    }
    
    struct Output {
        let categories: Observable<[CategorySearchSection]>
    }
    
    let resourceAPI: ResourceAPI!
    
    init(resourceAPI: ResourceAPI) {
        self.resourceAPI = resourceAPI
    }
    
    func transform(input: Input) -> Output {
        let categorySections = input.viewLayoutEvent
            .flatMap { _ in
                self.resourceAPI.getCategorySections()
            }
        
        return Output(categories: categorySections)
    }
}
