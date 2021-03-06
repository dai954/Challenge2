//
//  ExampleJSON.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/10/27.
//

import Foundation
@testable import Challenge2

extension FeedResult {

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

extension SearchResponse where Item == App {
//    https://itunes.apple.com/search?term=health&country=JP&entity=software
    static var exampleJSON: String {
       return """
        {
            "resultCount": 2,
            "results": [{
                    "trackId": 1094591345,
                    "trackName": "Pokémon GO",
                    "artistName": "Niantic, Inc.",
                    "screenshotUrls": [
                        "https://is2-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/eb/a1/3f/eba13f53-7be5-6655-319c-0cffef17ea6f/c37e0b2f-174d-4155-b75e-0d405343601c_Pokemon_iPhone6-8_Screen1_JP.png/392x696bb.png",
                        "https://is3-ssl.mzstatic.com/image/thumb/Purple124/v4/4a/2e/72/4a2e725e-644f-5d5f-fc73-77b647780725/fee3ba18-b792-4a30-8fdc-f24a6c8fedfc_Pokemon_iPhone6-8_Screen2_JP.png/392x696bb.png",
                        "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/a7/c1/c5/a7c1c50e-81b0-9440-8f59-9ef4a02b93ec/ba9ccbf0-b7b6-4ba3-8253-cca1c3c4dc60_Pokemon_iPhone6-8_Screen3_JP.png/392x696bb.png",
                        "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/82/4e/fa/824efade-ece9-d4fc-4425-5e4b6d98d0f7/b6740028-2f04-49b7-a3de-6e8ee3424657_Pokemon_iPhone6-8_Screen4_JP.png/392x696bb.png",
                        "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/25/8e/0d/258e0dc9-c0e0-74e6-5837-cb6ab7cd8e8f/13c0b0f7-eb04-499b-9497-833ae1fe8e18_Pokemon_iPhone6-8_Screen5_JP.png/392x696bb.png",
                        "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/4c/a8/f1/4ca8f1a1-1a99-16d3-084a-c69e1dc20090/3c744dfc-7036-441a-9898-bf09362221b8_Pokemon_iPhone6-8_Screen8_JP.png/392x696bb.png",
                        "https://is2-ssl.mzstatic.com/image/thumb/PurpleSource124/v4/25/4e/84/254e84fd-d140-dd6b-1054-12214ca580e1/910091b9-3cac-4eee-b100-a3f06fa7f0af_Pokemon_iPhone6-8_Screen2_JP.png/392x696bb.png",
                        "https://is4-ssl.mzstatic.com/image/thumb/PurpleSource124/v4/36/72/24/36722461-126a-5055-f5a4-77a45a8e2d8f/b657e9be-a603-45d6-a298-e97cce42b3b2_Pokemon_iPhone6-8_Screen6_JP.png/392x696bb.png",
                        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/c6/40/d9/c640d922-97c9-99fb-1010-c4c2d871800c/b8031784-d24c-4bac-87b9-a4040cd59415_Pokemon_iPhone6-8_Screen5_JP.png/392x696bb.png"
                    ],
                    "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/68/38/ff/6838ff2b-a21c-d0c0-9a05-81bc21cb6cd5/source/100x100bb.jpg",
                    "averageUserRating": 3.341130000000000155324642037157900631427764892578125,
                    "primaryGenreName": "game",
                    "description": "very good",
                    "releaseNotes": "驚きました。プッシュ通知またはアプリの中から接触確認を選ぶ",
                    "releaseDate":"2021-10-31T07:00:00Z"
                },
                {
                    "trackId": 1094591312,
                    "trackName": "artist2",
                    "artistName": "apple2",
                    "screenshotUrls": ["http//image2"],
                    "artworkUrl100": "http//image22",
                    "averageUserRating": 3.2,
                    "primaryGenreName": "Games",
                    "description": "very good 2",
                    "releaseNotes": "awsome",
                    "releaseDate":"2021-10-31T07:00:00Z"
                }
            ]
        }
    """
    }
    
}
