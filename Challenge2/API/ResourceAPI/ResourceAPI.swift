//
//  ResourceAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/31.
//

import RxSwift
import RxCocoa

class ResourceAPI: ResourceFeedAPIType {

    static let resourceAPIShared = ResourceAPI()

    func getCtegoryResource() -> Observable<[CategoryResouce]> {
        let resources = CategoryResouce.allCases
        return Observable.just(resources)
    }

    func getTagResource() -> Observable<[TagResource]> {
        let resources = TagResource.allCases
        return Observable.just(resources)
    }

    func getCategorySections() -> Observable<[CategorySearchSection]> {
        let categories = CategoryResouce.allCases
        let categorySearchSections = CategorySearchSection(header: "HEAD", items: categories)
        return Observable.just([categorySearchSections])
    }

    func getTagSections() -> Observable<[TagSearchSection]> {
        let tags = TagResource.allCases
        let tagSections = tags.map { tag in
            TagSearchSection(header: tag.title, items: tag.tags)
        }
        return Observable.just(tagSections)
    }

    func getFeedResult() -> Observable<FeedResult?> {
//        let limitNumber = 10
//        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/\(limitNumber)/apps.json"
//        let url = URL(string: urlString)!
//        let request = URLRequest(url: url)
//
//        return Observable.just(request)
//            .flatMap { request in
//                return URLSession.shared.rx.data(request: request)
//            }
//            .map { data in
//                return try JSONDecoder().decode(FeedResult.self, from: data)
//            }
        
        let url = Bundle(for: type(of: self)).url(forResource: "search_feedApp", withExtension: "json")!
        let data = try! Data(contentsOf: url)

        let response = try! JSONDecoder().decode(FeedResult.self, from: data)

        return Observable.just(response)
        
    }
}

