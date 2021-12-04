//
//  SemiModalPickerViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import RxSwift
import RxCocoa

class SemiModalPickerViewModel: ViewModelType {
    
    deinit {
        print("deinit view model")
    }
    
    init() {
        print("init view model")
    }
    
    struct Input {
        let cellTappedIndexPath: Driver<IndexPath>
        let itemSelected: Driver<(row: Int, component: Int)>
        let cellTappedString: Driver<[String]>
    }
    
    struct Output {
        let pickerData: Driver<[[String]]>
        let pickerLabelChangeTrigger: Driver<String>
        let pickerSelectedState: Driver<(row: Int, component: Int)>
    }
    
    func transform(input: Input) -> Output {
        
        let pickerData = input.cellTappedIndexPath
            .map { _ -> [[String]] in
                let data = ChallengeTerm.allCases.map { $0.text }
                return [data]
            }
        
        let pickerLabelDescriptionWithSelected = input.itemSelected
            .map { (row: Int, component: Int) -> String in
                let description = ChallengeTerm.allCases[row].description
                return description
            }
        
        let pickerLabelDescriptionAtBeginning = input.cellTappedString
            .map { stringArray -> String in
                let data = ChallengeTerm.allCases.map { $0.text }
                let row = Int(data.firstIndex(of: stringArray[0]) ?? 0)
                let description = ChallengeTerm(rawValue: row)?.description ?? ""
                return description
            }
        
        let pickerLabelChangeTrigger = Driver.of(pickerLabelDescriptionWithSelected , pickerLabelDescriptionAtBeginning).merge()
        
//        pickerData[0].map { $0.text }.firstIndex(of: textStore) ?? -1
        let pickerSelectedState = input.cellTappedString
            .map { stringArray -> (row: Int, component: Int) in
                let data = ChallengeTerm.allCases.map { $0.text }
                let component = stringArray.count - 1
                let row = Int(data.firstIndex(of: stringArray[0]) ?? -1)
                return (row: row, component: component)
            }
        
        
        return Output(pickerData: pickerData, pickerLabelChangeTrigger: pickerLabelChangeTrigger, pickerSelectedState: pickerSelectedState)
    }
    
}
