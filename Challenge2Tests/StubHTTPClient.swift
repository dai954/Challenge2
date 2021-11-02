//
//  StubHTTPClient.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation
@testable import Challenge2


class StubHTTPClient: HTTPClient {
    
    var result: Result<(Data, HTTPURLResponse), Error> = .success((Data(), HTTPURLResponse(url: URL(string: "https://itunes.apple.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))
    
    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> ()) {
        completion(result)
    }
    
    
}
