//
//  TeamCreatePremiumCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/29.
//

import RxSwift
import RxCocoa
//let questionButtonTapped: Signal<()>
class TeamCreatePremiumCellViewModel {
    let id = UUID().uuidString
    let disposeBag = DisposeBag()
    
    struct Input {
        let questionButtonTapped: Signal<()>
    }
    
    let premiumSwitchIsEnabled: Driver<Bool>
    let premiumTitleAlpha: Driver<CGFloat>
    
    init(beginnerSwitchIsOn: Driver<Bool>) {
        self.premiumSwitchIsEnabled = beginnerSwitchIsOn.map{ !$0 }
        
        self.premiumTitleAlpha = beginnerSwitchIsOn.map { bool in
            if bool {
                return 0.8
            } else {
                return 1
            }
        }
        
    }
    
    func wireAction(input: Input) {
        let wireframe = DefaultWireframe.shared

        let _ = input.questionButtonTapped
            .flatMap { detailAndTestData -> Driver<String> in
                let description = TeamLevelTag.premire.description

                return wireframe.promptFor(title: TeamLevelTag.premire.wireTitle, message: description, titleColor: .black, messageColor: .lightGray, titleFont: nil, messageFont: .systemFont(ofSize: 14), actionTextColor: UIColor.primaryRed() , cancelAction: "閉じる", actions: [], preferrdeStyle: .alert, cancelActionStyle: .default).asDriver(onErrorJustReturn: "")
            }.drive(onNext: { action in
                print("action: ", action)
            }).disposed(by: disposeBag)
    }
    
}
