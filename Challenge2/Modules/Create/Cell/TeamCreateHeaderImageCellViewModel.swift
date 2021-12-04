//
//  File.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa

class TeamCreateHeaderImageCellViewModel {
    let id = UUID().uuidString
    let backImageSelection: Driver<UIImage>
    
    init(backImageSelection: Driver<BackImageResource>) {
        
        self.backImageSelection = backImageSelection.map { $0.backImage }
        
    }
}
