//
//  FavoriteRegisterCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/11.
//

import RxSwift
import RxCocoa
import RxDataSources

class FavoriteRegisterCellViewModel {
    
    let numberOfFavoriteText: Driver<NSMutableAttributedString>
    
    init(sampleAPI: ChallengeSampleDataAPI = ChallengeSampleDataAPI.challengeSampleDataAPIShared) {
        let testData = sampleAPI.getSampleTeamData()
        let numberOfFavorite = testData.NumberOfFavorite
        
        numberOfFavoriteText = Driver.just(numberOfFavorite)
            .map { number -> NSMutableAttributedString  in
                let stringOfNumber = String(number)
                let digit = stringOfNumber.count
                let string = "現在\(stringOfNumber)人がお気に入りしています"
                let attributedString = NSMutableAttributedString(string: string)
                attributedString.addAttribute(.foregroundColor,
                                              value: UIColor.primaryRed(), range: NSMakeRange(2, digit + 1))
                return attributedString
            }
    }
    
}
