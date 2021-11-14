//
//  SearchResultTests.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/11/01.
//

import XCTest
@testable import Challenge2

class SearchResponseTests: XCTestCase {
    
//    "https://itunes.apple.com/search?term=health&country=JP&entity=software"
    func testDecodeSearchResponse() throws {
        let data = SearchResponse<App>.exampleJSON.data(using: .utf8)!
        
        let searchResult = try JSONDecoder().decode(SearchResponse<App>.self, from: data)

        let firstResult = searchResult.results.first!
        
        XCTAssertEqual(searchResult.resultCount, 2)
        XCTAssertEqual(firstResult.artistName, "Niantic, Inc.")
        XCTAssertEqual(firstResult.releaseDate, "2021-10-31T07:00:00Z")
        
        let ceiledRating = ceil(firstResult.averageUserRating! * 10) / 10
        XCTAssertEqual(ceiledRating, 3.4)
    }
}
