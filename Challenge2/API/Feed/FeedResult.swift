//
//  AppResult.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import Foundation

struct FeedResult: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [FeedContent]
}

struct FeedContent: Decodable {
    let name: String
    let artworkUrl100: String
}
