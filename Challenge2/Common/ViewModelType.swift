//
//  ViewModelType.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/31.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
