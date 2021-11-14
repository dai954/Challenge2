//
//  App.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

struct App: Decodable {
    var trackId: Int?
    var screenshotUrls: [String]?
    let artworkUrl100: String // app icon
    let averageUserRating: Float?
    let primaryGenreName: String
    var description: String?
    let trackName: String
    var artistName: String?
    var releaseNotes: String?
    var releaseDate: String
}
