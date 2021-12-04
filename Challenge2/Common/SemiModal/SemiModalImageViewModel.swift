//
//  BackGroundImageCollectionViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class SemiModalImageViewModel: ViewModelType {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let viewWillAppearEvent: Signal<()>
        let itemSelectedEvent: Driver<IndexPath>
    }
    
    struct Output {
        let sections: Driver<[BackGroundImageSection]>
        let itemSelectedTrigger: Driver<IndexPath>

    }
    
    func transform(input: Input) -> Output {
        let resourceAPI = ResourceAPI.resourceAPIShared

       let sections = input.viewWillAppearEvent
        .flatMap { _ -> Driver<[BackGroundImageSection]> in
            return resourceAPI.getBackImageSections().asDriver(onErrorJustReturn: [])
        }

        let itemSelectedTrigger = input.itemSelectedEvent
        
        return Output(sections: sections, itemSelectedTrigger: itemSelectedTrigger)
    }
}
