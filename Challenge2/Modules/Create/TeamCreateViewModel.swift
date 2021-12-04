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
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let viewWillAppearEvent: Signal<()>
        let itemSelected: Driver<IndexPath>
        let categoryCellTapped: Driver<String>
        let premiumSwitchTapped: Driver<Bool>
        let beginnerSwitchTapped: Driver<Bool>
        let doneButtonTappedWithImageEvent: Driver<BackImageResource>
        let doneButtonTappedWithTextEvent: Driver<[String]>
        let viewTappedEvent: Driver<Void>
    }
    
    struct Output {
        let teamCreateSections: Driver<[AnimatedTeamCreateSection]>
        let pickerTrigger: Driver<IndexPath>
        let selectImageTrigger: Driver<IndexPath>
        let categorySelectTrigger: Driver<IndexPath>
        let pickerTriggerWithString: Driver<(IndexPath, [String])>
    }
    
    private var optionIsOpen = BehaviorRelay<Bool>(value: false)

    
    func transform(input: Input) -> Output {
        
        let optionTopCellSelected = input.itemSelected.filter { indexPath in
            return indexPath.section == 1 && indexPath.item == 0
        }.map { indexPath -> Void in
            self.optionIsOpen.accept(!self.optionIsOpen.value)
            return ()
        }
        
       let cellLayoutEvent = Driver.of(input.viewWillAppearEvent.asDriver(onErrorJustReturn: ()), optionTopCellSelected).merge()
        
        let sections = cellLayoutEvent.withLatestFrom(optionIsOpen.asDriver())
            .map { isOpened -> [AnimatedTeamCreateSection] in
                var items1: [TeamCreateSectionItem] = []
                var items2: [TeamCreateSectionItem] = []
                var items3: [TeamCreateSectionItem] = []
                items1.append(.teamCreateImage(viewModel: TeamCreateImageCellViewModel(backImageSelection: input.doneButtonTappedWithImageEvent, premiumSwitchIsOn: input.premiumSwitchTapped, beginnerSwitchIsOn: input.beginnerSwitchTapped)))
                items1.append(.teamCreateCategory(viewModel: TeamCreateCategoryCellViewModel(categoryCellTapped: input.categoryCellTapped)))
                items1.append(.teamCreateNmae(viewModel: TeamCreateNameCellViewModel(parentViewTappedTrigger: input.viewTappedEvent)))
                items1.append(.teamCreateHeaderImage(viewModel: TeamCreateHeaderImageCellViewModel(backImageSelection: input.doneButtonTappedWithImageEvent)))
                items1.append(.teamCreatePremium(viewModel: TeamCreatePremiumCellViewModel(beginnerSwitchIsOn: input.beginnerSwitchTapped)))
                items1.append(.teamCreateBeginner(viewModel: TeamCreateBeginnerCellViewModel(premiumSwitchIsOn: input.premiumSwitchTapped)))
                items1.append(.teamCreateChallenge(viewModel: TeamCreateChallengeTermCellViewModel(textSelection: input.doneButtonTappedWithTextEvent)))
                items1.append(.teamCreateDescription(viewModel: TeamCreateDescriptionCellViewModel(parentViewTappedTrigger: input.viewTappedEvent)))
                items2.append(.teamCreateOptionTop(viewModel: TeamCreateOptionTopCellViewModel()))
                items3.append(.teamCreateButton(viewModel: TeamCreateOptionBottomCellViewModel()))
                if isOpened {
                    items2.append(.teamCreateMemberOption(viewModel: TeamCreateOptionCellViewModel()))
                    items2.append(.teamCreateAgeOption(viewModel: TeamCreateOptionCellViewModel()))
                    items2.append(.teamCreateGenderOption(viewModel: TeamCreateOptionCellViewModel()))
                    items2.append(.teamCreateExitTermOption(viewModel: TeamCreateOptionCellViewModel()))
                    items2.append(.teamCreateAssistantOption(viewModel: TeamCreateOptionBottomCellViewModel()))
                }
                let section1 = AnimatedTeamCreateSection(model: .section1, items: items1)
                let section2 = AnimatedTeamCreateSection(model: .section2, items: items2)
                let section3 = AnimatedTeamCreateSection(model: .section3, items: items3)
                return [section1, section2, section3]
            }
        
        let pickerTrigger = input.itemSelected
            .filter { indexPath in
                indexPath.section == 0 && indexPath.item == 6 ||
                indexPath.section == 1 && 1...5 ~= indexPath.item
            }
        let pickerTriggerWithStringCombine = Driver.combineLatest(pickerTrigger, input.doneButtonTappedWithTextEvent)
        let pickerTriggerWithString = pickerTrigger.withLatestFrom(pickerTriggerWithStringCombine)
        
        let selectImageTrigger = input.itemSelected
            .filter { indexPath in
                indexPath.section == 0 && indexPath.item == 3
            }
        
        let categorySelectTrigger = input.itemSelected
            .filter { indexPath in
                return indexPath.section == 0 && indexPath.item == 1
            }
        
        return Output(teamCreateSections: sections, pickerTrigger: pickerTrigger, selectImageTrigger: selectImageTrigger, categorySelectTrigger: categorySelectTrigger, pickerTriggerWithString: pickerTriggerWithString)
    }
    
}
