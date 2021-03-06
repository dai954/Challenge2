//
//  MockChallengeAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/03.
//

import RxSwift

protocol ChallengeAPIType {
//    func getTeamListSections(keyword: String) -> Observable<[TeamListSection]>
    func getTeamDetail(appId: Int) -> Observable<App>
    func getTeamList(keyword: String) -> Observable<[App]>
}

class MockChallengeAPI: ChallengeAPIType {
    
    static let mockChallegeAPIShared = MockChallengeAPI()
    
    func getTeamListSections(keyword: String) -> Observable<[TeamListSection]> {
        let url = Bundle(for: type(of: self)).url(forResource: "search_itunes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let response = try! JSONDecoder().decode(SearchResponse<App>.self, from: data)
        let apps = response.results
        
        let teamListCellViewModels = apps.map { app in
            return TeamListCellViewModel(app: app)
        }
        
        let teamListSections = TeamListSection(header: "header", items: teamListCellViewModels)
        
        return Observable.just([teamListSections]).delay(.seconds(1), scheduler: MainScheduler.instance)
    }
    
    func getTeamList(keyword: String) -> Observable<[App]> {
        let url = Bundle(for: type(of: self)).url(forResource: "search_itunes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let response = try! JSONDecoder().decode(SearchResponse<App>.self, from: data)
        let apps = response.results
        
        return Observable.just(apps)
    }
    
    func getTeamDetail(appId: Int) -> Observable<App> {
        let url = Bundle(for: type(of: self)).url(forResource: "search_app", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let response = try! JSONDecoder().decode(SearchResponse<App>.self, from: data)
        let app = response.results[0]
        
        return Observable.just(app)
    }
    
    func getSampleApp() -> App {
        let url = Bundle(for: type(of: self)).url(forResource: "search_itunes", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let response = try! JSONDecoder().decode(SearchResponse<App>.self, from: data)
        let apps = response.results
        let app = apps[0]
        return app
    }
}
