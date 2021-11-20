//
//  AppResult.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/01.
//

import Foundation

struct SearchResponse<Item: Decodable>: Decodable {
    let resultCount: Int
    let results: [Item]
}
