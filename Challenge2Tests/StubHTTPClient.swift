//
//  StubHTTPClient.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa
@testable import Challenge2


//class StubHTTPClient: HTTPClient {
//
//    var result: Result<(Data, HTTPURLResponse), Error> = .success((Data(), HTTPURLResponse(url: URL(string: "https://itunes.apple.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))
//
//    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> ()) {
//        completion(result)
//    }
//
//
//}

class StubHTTPClient: HTTPClient {
    
    var result: Observable<Result<(Data, HTTPURLResponse), Error>> = Observable.just(.success((Data(), HTTPURLResponse(url: URL(string: "https://itunes.apple.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!)))
    
    func sendRequest(urlRequest: URLRequest) -> Observable<Result<(Data, HTTPURLResponse), Error>> {
        return result
    }
    
    
    var result2: (Data, HTTPURLResponse) = ((Data(), HTTPURLResponse(url: URL(string: "https://itunes.apple.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))
    
    var stubClientRrsult: StubClientResult = .succeed
    enum StubClientResult {
        case succeed
        case connectionError
        case parseError
        case apiError
    }
    
    func sendReq(urlRequest: URLRequest) -> Observable<(Data, HTTPURLResponse)> {
        return Observable<(Data, HTTPURLResponse)>.create { observer in
            
            switch self.stubClientRrsult {
            case .succeed: observer.onNext(self.result2)
            case .connectionError:
                observer.onError(ChallengeClientError.connectionError(URLError(.cannotConnectToHost)))
            case .parseError: observer.onNext(self.result2)
            case .apiError: observer.onNext(self.result2)
            }
  
            return Disposables.create()
        }
    }
}
