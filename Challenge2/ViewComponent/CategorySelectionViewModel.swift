//
//  CategorySelectionViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import RxSwift
import RxCocoa

class CategorySelectionViewModel: ViewModelType {
    
    struct Input {
        let selection: Driver<CategoryResouce>
    }
    
    struct Output {
        let categorySelectedTitle: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        
        let categorySelected = input.selection
            .map { categoryResouce in
                categoryResouce.title
            }
        
        return Output(categorySelectedTitle: categorySelected)
    }
    
}
