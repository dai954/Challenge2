//
//  ChallengeAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/03.
//

import RxSwift
import RxCocoa

class ChallengeAPI: ChallengeAPIType {
    
    static let challengeAPIShared = ChallengeAPI()
    
    var challengeClient = ChallengeClient.challengeClientShared
    
    func getTeamListSections(keyword: String) -> Observable<[TeamListSection]> {
        let request = ChallengeAPIRequest.SearchApps.init(keyword: keyword, country: .japan, entity: .software)

        return challengeClient.search(request: request)
            .map { result in
                switch result {
                case .success(let response):
                    let apps = response.results
                    let teamListCellViewModels = apps.map { app in
                        return TeamListCellViewModel(app: app)
                    }
                    let teamListSections = TeamListSection(header: "header", items: teamListCellViewModels)
                    return [teamListSections]
                case .failure(let error):
                    throw error
                }
            }
        }
    
    func getTeamList(keyword: String) -> Observable<[App]> {
        let request = ChallengeAPIRequest.SearchApps.init(keyword: keyword, country: .japan, entity: .software)

        return challengeClient.search(request: request)
            .map { result in
                switch result {
                case .success(let response):
                    let apps = response.results
                    return apps
                case .failure(let error):
                    throw error
                }
            }
        }
    
    func getTeamDetail(appId: Int) -> Observable<App> {
        let request = ChallengeAPIRequest.LookUpApp.init(appId: appId)
        
        return challengeClient.search(request: request)
            .map { result in
                switch result {
                case .success(let response):
                    print("app in CallengeAPI", response)
                    let app = response.results[0]
                    return app
                default:
                    fatalError("failed to fetch data")
                }
            }
    }
    
}
