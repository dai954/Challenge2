//
//  ChallengeClientError.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

enum ChallengeClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case challengeAPIError
}
