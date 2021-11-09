//
//  ChallengeAPIRequest.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

//https://itunes.apple.com/search?term=health&country=JP&entity=software
//https://itunes.apple.com/lookup?id=1094591345
struct ChallengeAPIRequest {
    
    struct SearchApps: ChallengeRequest {
        typealias Response = SearchResponse<App>
        
        let keyword: String
        let country: CountryMnemonicCode
        let entity: Entity?
        
        init(keyword: String, country: CountryMnemonicCode, entity: Entity?) {
            self.keyword = keyword
            self.country = country
            self.entity = entity
        }
        
        var path: String {
            return "/search"
        }
        
        var httpMethod: HTTPMethod {
            return .get
        }
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "term", value: keyword),
                    URLQueryItem(name: "country", value: country.rawValue),
                    URLQueryItem(name: "entity", value: entity?.rawValue)]
        }
        
    }
    
    struct LookUpApp: ChallengeRequest {
        typealias Response = SearchResponse<App>
        
        let appId: Int
        
        init(appId: Int) {
            self.appId = appId
        }
        
        var path: String {
            return "/lookup"
        }
        
        var httpMethod: HTTPMethod {
            return .get
        }
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "id", value: String(appId))]
        }
    }
}
