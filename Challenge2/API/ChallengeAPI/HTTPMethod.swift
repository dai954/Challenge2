//
//  File.swift
//  
//
//  Created by 石川大輔 on 2021/10/31.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case option = "OPTION"
    case connect = "CONNECT"
}
