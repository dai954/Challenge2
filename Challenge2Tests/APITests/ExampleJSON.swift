//
//  ExampleJSON.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/10/27.
//

import Foundation
@testable import Challenge2

extension AppResult {

    static var exampleJSON: String {
        return """
            {"feed": {
            "title": "apple",
            "id": "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json",
            "results": [{
            "name": "apple",
            "artworkUrl100": "https://is5-ssl.mzstatic.png"
            }]
            }
            }
            """
    }

}
