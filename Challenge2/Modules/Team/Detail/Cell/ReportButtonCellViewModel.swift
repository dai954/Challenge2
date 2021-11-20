//
//  ReportButtonCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/11.
//

import RxSwift
import RxCocoa

class ReportButtonCellViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let reportButtonTapped: Signal<()>
    }
    
    func wireAction(input: Input) {
        let wireframe = DefaultWireframe.shared
        input.reportButtonTapped
            .flatMap({ _ in
                return wireframe.promptFor(title: nil, message: nil, titleColor: nil, messageColor: nil, titleFont: nil, messageFont: nil, actionTextColor: UIColor.primaryRed(), cancelAction: "閉じる", actions: ["通報する"], preferrdeStyle: .actionSheet).asDriver(onErrorJustReturn: "")
            }).drive(onNext: { action in
                print("action: ", action)
            }).disposed(by: disposeBag)

    }
    
}
