//
//  TeamDetailCellViewModel.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift
import RxCocoa

class DetailInfoCellViewModel {
    let disposeBag = DisposeBag()
    
    let appData: Driver<App>
    let detailInfo: Driver<DetailInfo>
    let teamTestData: Driver<TeamTestData>
    
    let title: Driver<String>
    let isQuestionLabelHidden: Driver<Bool>
    let info: Driver<String>
    let assistantColor: Driver<UIImage?>
    let isAssistantHidden: Driver<Bool>
    
    struct Input {
        let questionButtonTapped: Signal<()>
    }
    

    init(app: App, detail: DetailInfo, sampleAPI: ChallengeSampleDataAPI = ChallengeSampleDataAPI.challengeSampleDataAPIShared) {
        self.appData = Driver.just(app)
        self.detailInfo = Driver.just(detail)
        let testData = sampleAPI.getSampleTeamData()
        self.teamTestData = Driver.just(testData)
        self.title = Driver.just(detail.title)
        self.isQuestionLabelHidden = Driver.just(detail.isQuestionLabelHidden)
        
        info = Driver.combineLatest(detailInfo, teamTestData, appData) { detail, testData, appData -> String in
                switch detail {
                case .lastUpdate:
                    return appData.releaseDate.challengeDateString
                case .ageRestrict:
                    if testData.upperAgeTestrict == .no && testData.lowerAgeRestrict == .no {
                        return "制限なし"
                    }
                    return "\(testData.lowerAgeRestrict.text) ~ \(testData.upperAgeTestrict.text)"
                case .genderRistrict:
                    return "\(testData.genderRestrict.text)"
                case .challengeTerm:
                    return "残り\(testData.lastChallengeTerm)日間"
                case .autoExitTerm:
                    return "\(testData.autoExitTerm.text)"
                case .assistantColor:
                    return "\(testData.assistantColor.text)"
                }
        }
        
        assistantColor = teamTestData
            .map{ data -> UIImage? in
                return data.assistantColor.image
            }
        
        isAssistantHidden = detailInfo
            .map { detail in
                detail.isAssinstantIconHidden
            }
    }
    
    func wireAction(input: Input) {
        print("called wire action")
        let wireframe = DefaultWireframe.shared
        let detailAndTestData = Driver.combineLatest(detailInfo, teamTestData)
        
        let _ = input.questionButtonTapped.withLatestFrom(detailAndTestData)
            .flatMap { detailAndTestData -> Driver<String> in
                var description = detailAndTestData.0.description
                
                if detailAndTestData.0 == .assistantColor {
                    description += detailAndTestData.1.assistantColor.description
                    description += "オーナーのみ変更できます。"
                }
                
                return wireframe.promptFor(title: nil, message: description, titleColor: nil, messageColor: .lightGray, titleFont: nil, messageFont: .systemFont(ofSize: 14), actionTextColor: UIColor.primaryRed() , cancelAction: "閉じる", actions: [], preferrdeStyle: .alert, cancelActionStyle: .default).asDriver(onErrorJustReturn: "")
            }.drive(onNext: { action in
                print("action: ", action)
            }).disposed(by: disposeBag)
        
    }
    
}
