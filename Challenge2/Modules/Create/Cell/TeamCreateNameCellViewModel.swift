//
//  TeamCreateNameCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class TeamCreateNameCellViewModel: ViewModelType {
    
    let id = UUID().uuidString
    
    struct Input {
        let textFieldEditingEvent: Driver<String>
    }
    
    struct Output {
        let validatedTextField: Driver<TextFieldValidationResult>
    }
    
    let parentViewTappedTrigger: Driver<Void>
    
    init(parentViewTappedTrigger: Driver<Void>) {
        self.parentViewTappedTrigger = parentViewTappedTrigger
    }
    
    func transform(input: Input) -> Output {
        
        let validatedTextField = input.textFieldEditingEvent
            .skip(2)
            .map { text -> TextFieldValidationResult in
                if (1...15) ~= text.count {
                    return .ok(message: "\(text.count)/15文字")
                } else if text.count > 15 {
                    return .over(message: "\(text.count)/15文字")
                } else {
                    return .empty
                }
            }
        
        return Output(validatedTextField: validatedTextField)
    }
    
}
