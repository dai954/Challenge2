//
//  ResourceAPI.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/31.
//

import RxSwift

class ResourceAPI {

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

}

