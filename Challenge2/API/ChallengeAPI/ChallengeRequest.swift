//
//  ChallengeRequest.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

//https://itunes.apple.com/search?term=health&country=JP&entity=software
//https://itunes.apple.com/lookup?id=1094591345
protocol ChallengeRequest {
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
}

extension ChallengeRequest {
    
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        switch httpMethod {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("unsupported method \(httpMethod)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = httpMethod.rawValue
        
        return urlRequest
    }
    
    func response(from data: Data, urlResponse: HTTPURLResponse) throws -> Response {
        
        if (200..<300).contains(urlResponse.statusCode) {
            return try JSONDecoder().decode(Response.self, from: data)
        } else {
            throw ChallengeClientError.challengeAPIError
        }
        
    }
    
}
