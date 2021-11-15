//
//  HTTPClient.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa

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
