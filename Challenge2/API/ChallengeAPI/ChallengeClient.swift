//
//  ChallengeClient.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa

class ChallengeClient {
    
    static let challengeClientShared = ChallengeClient(httpClient: URLSession.shared)
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func search<Request: ChallengeRequest>(request: Request) -> Observable<Result<Request.Response, ChallengeClientError>> {
        let urlRequest = request.buildURLRequest()

        return httpClient.sendRequest(urlRequest: urlRequest)
            .flatMap { result -> Observable<Result<Request.Response, ChallengeClientError>> in
                switch result {
                case .success((let data, let urlResponse)):
                    do {
                        let response = try request.response(from: data, urlResponse: urlResponse)
                        return .just(.success((response)))
                    } catch ChallengeClientError.challengeAPIError {
                        return .just(.failure(.challengeAPIError))
                    } catch {
                        return .just(.failure(.responseParseError(error)))
                    }
                case .failure(let error):
                    return .just(.failure(.connectionError(error)))
                }
            }
    }
    
}
