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
    
    let appData: Observable<App>
    let detailInfo: Observable<DetailInfo>
    let teamTestData: Observable<TeamTestData>
    
    let title = BehaviorRelay<String?>(value: nil)
    let isQuestionLabelHidden = BehaviorRelay<Bool>(value: true)
    let info: Observable<String>
    let assistantColor: Observable<UIImage?>
    let isAssistantHidden: Observable<Bool>
    
    struct Input {
        let questionButtonTapped: Observable<Void>
    }
    

    init(app: App, detail: DetailInfo, mockAPI: MockChallengeAPI = MockChallengeAPI.mockChallegeAPIShared) {
        self.appData = Observable.just(app)
        self.detailInfo = Observable.just(detail)
        let testData = mockAPI.getSampleTeamData()
        self.teamTestData = Observable.just(testData)
        title.accept(detail.title)
        isQuestionLabelHidden.accept(detail.isQuestionLabelHidden)
        
        info = Observable.combineLatest(detailInfo, teamTestData, appData) { detail, testData, appData -> String in
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
        }.share(replay: 1)
        
        assistantColor = teamTestData
            .map{ data -> UIImage? in
                return data.assistantColor.image
            }.share(replay: 1)
        
        isAssistantHidden = detailInfo
            .map { detail in
                detail.isAssinstantIconHidden
            }.share(replay: 1)
    }
    
    func wireAction(input: Input) {
        print("called wire action")
        let wireframe = DefaultWireframe.shared
        let detailAndTestData = Observable.combineLatest(detailInfo, teamTestData)
        
        let _ = input.questionButtonTapped.withLatestFrom(detailAndTestData)
            .flatMap { detailAndTestData -> Observable<String> in
                var description = detailAndTestData.0.description
                
                if detailAndTestData.0 == .assistantColor {
                    description += detailAndTestData.1.assistantColor.description
                    description += "オーナーのみ変更できます。"
                }
                
                return wireframe.promptFor(title: nil, message: description, titleColor: nil, messageColor: .lightGray, titleFont: nil, messageFont: .systemFont(ofSize: 14), actionTextColor: UIColor.primaryRed() , cancelAction: "閉じる", actions: [], preferrdeStyle: .alert, cancelActionStyle: .default)
            }.subscribe(onNext: { action in
                print("action: ", action)
            }).disposed(by: disposeBag)
        
    }
    
}
