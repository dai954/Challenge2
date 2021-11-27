//
//  TeamCreateViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import RxSwift
import RxCocoa
import RxOptional
import RxDataSources

class TeamCreateViewModel: ViewModelType {
    
    struct Input {
        let viewWillAppearEvent: Signal<()>
        let itemSelected: Driver<IndexPath>
    }
    
    struct Output {
//        let teamCreateSections: Driver<[TeamCreateSection]>
        let teamCreateSections: Driver<[AnimatedTeamCreateSection]>
        let pickerTrigger: Driver<IndexPath>
        let categorySelectTrigger: Driver<IndexPath>
    }
    
    private var isOpen = BehaviorRelay<Bool>(value: false)
    
    func transform(input: Input) -> Output {
        
        let optionTopCellSelected = input.itemSelected.filter { indexPath in
            return indexPath.section == 1 && indexPath.item == 0
        }.map { indexPath -> Void in
            self.isOpen.accept(!self.isOpen.value)
            return ()
        }
        
       let cellLayoutEvent = Driver.of(input.viewWillAppearEvent.asDriver(onErrorJustReturn: ()), optionTopCellSelected).merge()
        
        let sections = cellLayoutEvent.withLatestFrom(isOpen.asDriver())
            .map { isOpened -> [AnimatedTeamCreateSection] in
                print("isOpen", isOpened)
                var items1: [TeamCreateSectionItem] = []
                var items2: [TeamCreateSectionItem] = []
                var items3: [TeamCreateSectionItem] = []
                items1.append(.teamCreateImage)
                items1.append(.teamCreateCategory)
                items1.append(.teamCreateNmae)
                items1.append(.teamCreateHeaderImage)
                items1.append(.teamCreatePremium)
                items1.append(.teamCreateBeginner)
                items1.append(.teamCreateChallenge)
                items1.append(.teamCreateDescription)
                items2.append(.teamCreateOptionTop)
                items3.append(.teamCreateButton)
                if isOpened {
                    items2.append(.teamCreateMemberOption)
                    items2.append(.teamCreateAgeOption)
                    items2.append(.teamCreateGenderOption)
                    items2.append(.teamCreateExitTermOption)
                    items2.append(.teamCreateAssistantOption)
                }
                let section1 = AnimatedTeamCreateSection(model: .section1, items: items1)
                let section2 = AnimatedTeamCreateSection(model: .section2, items: items2)
                let section3 = AnimatedTeamCreateSection(model: .section3, items: items3)
                return [section1, section2, section3]
            }
        
        let pickerTrigger = input.itemSelected
            .filter { indexPath in
                return indexPath.section == 0 && indexPath.item == 3 ||
                indexPath.section == 0 && indexPath.item == 6 ||
                indexPath.section == 1 && 1...5 ~= indexPath.item
            }
        
        let categorySelectTrigger = input.itemSelected
            .filter { indexPath in
                return indexPath.section == 0 && indexPath.item == 1
            }
        
        return Output(teamCreateSections: sections, pickerTrigger: pickerTrigger, categorySelectTrigger: categorySelectTrigger)
    }
    
}
