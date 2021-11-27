//
//  CategoryViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import Foundation

import RxSwift
import RxCocoa

class CategoryViewModel: ViewModelType {
    
    struct Input {
        let viewWillAppearEvent: Signal<()>
    }
    
    struct Output {
        let categories: Driver<[CategorySearchSection]>
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
        
        return Output(categories: categorySections)
    }
}
