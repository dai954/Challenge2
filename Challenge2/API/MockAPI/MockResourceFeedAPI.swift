//
//  MockResourceFeedAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import RxSwift

protocol ResourceFeedAPIType {
    func getFeedResult() -> Observable<FeedResult?>
}


class MockResourceFeedAPI: ResourceFeedAPIType {
    
    static let mockResourceFeedAPIShared = MockResourceFeedAPI()
    
    func getFeedResult() -> Observable<FeedResult?> {
        let url = Bundle(for: type(of: self)).url(forResource: "search_feedApp", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let response = try! JSONDecoder().decode(FeedResult.self, from: data)
        
        return Observable.just(response)
    }
}
