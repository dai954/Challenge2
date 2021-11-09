//
//  HTTPClient.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa

//protocol HTTPClient {
//    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> () )
//}
//
//extension URLSession: HTTPClient {
//    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> ()) {
//
//        let task = dataTask(with: urlRequest) { data, urlResponse, error in
//            switch (data, urlResponse, error) {
//            case (_, _, let error?):
//                completion(Result.failure(error))
//            case (let data?, let urlResponse as HTTPURLResponse, _):
//                completion(Result.success((data, urlResponse)))
//            default:
//                fatalError("invalid response combination \(String(describing: (data, urlResponse, error))).")
//            }
//        }
//        task.resume()
//    }
//}

protocol HTTPClient {
    func sendRequest(urlRequest: URLRequest) -> Observable<Result<(Data, HTTPURLResponse), Error>>
}

extension URLSession: HTTPClient {
    func sendRequest(urlRequest: URLRequest) -> Observable<Result<(Data, HTTPURLResponse), Error>> {
        
        return rx.response(request: urlRequest)
            .map { pair in
                return .success((pair.data, pair.response))
            }
            .catch { error in
                return Observable.just(.failure(error))
            }
        
    }
}
