//
//  AppResultTests.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/10/27.
//

import Foundation
import XCTest
@testable import Challenge2

class AppResultTests: XCTestCase {

    func testDecode() throws {

        let data = AppResult.exampleJSON.data(using: .utf8)!
        let result = try JSONDecoder().decode(AppResult.self, from: data)

        let firstResult = result.feed.results.first

        XCTAssertEqual(firstResult?.artworkUrl100, "https://is5-ssl.mzstatic.png")
        XCTAssertEqual(firstResult?.name, "apple")

    }

}
