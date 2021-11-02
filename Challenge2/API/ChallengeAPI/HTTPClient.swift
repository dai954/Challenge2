//
//  HTTPClient.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/02.
//

import Foundation

protocol HTTPClient {
    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> () )
}

extension URLSession: HTTPClient {
    func sendRequest(urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> ()) {
        let task = dataTask(with: urlRequest) { data, urlResponse, error in
            switch (data, urlResponse, error) {
            case (_, _, let error?):
                completion(Result.failure(error))
            case (let data?, let urlResponse as HTTPURLResponse, _):
                completion(Result.success((data, urlResponse)))
            default:
                fatalError("invalid response combination \(String(describing: (data, urlResponse, error))).")
            }
        }
        task.resume()
    }
}
