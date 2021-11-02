//
//  ChallengeClient.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

class ChallengeClient {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func send<Request: ChallengeRequest>(request: Request, completion: @escaping (Result<Request.Response, ChallengeClientError>) -> ()) {
        
        let urlRequest = request.buildURLRequest()
        
        httpClient.sendRequest(urlRequest: urlRequest) { result in
            switch result {
            case .success((let data, let urlResponse)):
                do {
                    let response = try request.response(from: data, urlResponse: urlResponse)
                    completion(.success(response))
                } catch ChallengeClientError.challengeAPIError {
                    completion(.failure(.challengeAPIError))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            case .failure(let error):
                completion(.failure(.connectionError(error)))
            }
        }
        
    }
}
