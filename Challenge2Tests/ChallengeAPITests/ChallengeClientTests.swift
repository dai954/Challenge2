//
//  ChallengeClientTests.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/11/02.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Challenge2

//class ChallengeClientTests: XCTestCase {
//
//    var httpClient: StubHTTPClient!
//    var challengeClient: ChallengeClient!
//
//    override func setUp() {
//        httpClient = StubHTTPClient()
//        self.challengeClient = ChallengeClient(httpClient: httpClient)
//    }
//
//    private func makeHTTPClientResult(statusCode: Int, json: String) -> Result<(Data, HTTPURLResponse), Error> {
//        return .success((json.data(using: .utf8)!, HTTPURLResponse(url: URL(string: "https://itunes.apple.com/search")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!))
//    }
//
//    func testSuccess() {
//        httpClient.result = makeHTTPClientResult(statusCode: 200, json: SearchResponse<App>.exampleJSON)
//
//        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
//        let apiExpectation = expectation(description: "")
//
//        challengeClient.send(request: request) { result in
//            switch result {
//            case .success(let response):
//                let firstApp = response.results.first
//                XCTAssertEqual(firstApp?.artistName, "Niantic, Inc.")
//                XCTAssertEqual(response.resultCount, 2)
//            default:
//                XCTFail("unexpected result \(result)")
//            }
//            apiExpectation.fulfill()
//        }
//
//        wait(for: [apiExpectation], timeout: 2)
//    }
//
//    func testFailureByConnectionError() {
//        httpClient.result = .failure(URLError(.cannotConnectToHost))
//
//        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
//        let apiExpectation = expectation(description: "")
//
//        challengeClient.send(request: request) { result in
//            switch result {
//            case .failure(.connectionError):
//                break
//            default:
//                XCTFail("unexpected result: \(result)")
//            }
//            apiExpectation.fulfill()
//        }
//        wait(for: [apiExpectation], timeout: 2)
//    }
//
//    func testFailureByResponseParseError() {
//        httpClient.result = makeHTTPClientResult(statusCode: 200, json: "{}")
//
//        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
//        let apiExpectation = expectation(description: "")
//
//        challengeClient.send(request: request) { result in
//            switch result {
//            case .failure(.responseParseError):
//                break
//            default:
//                XCTFail("unexpected result: \(result)")
//            }
//            apiExpectation.fulfill()
//        }
//        wait(for: [apiExpectation], timeout: 2)
//    }
//
//    func testFailureByAPIError() {
//        httpClient.result = makeHTTPClientResult(statusCode: 400, json: "{}")
//        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
//        let apiExpectation = expectation(description: "")
//
//        challengeClient.send(request: request) { result in
//            switch result {
//            case .failure(.challengeAPIError):
//                break
//            default:
//                XCTFail("unexpected rsult: \(result)")
//            }
//            apiExpectation.fulfill()
//        }
//        wait(for: [apiExpectation], timeout: 2)
//    }
//}

class ChallengeClientTests: XCTestCase {
    
    var httpClient: StubHTTPClient!
    var challengeClient: ChallengeClient!
    
    let disposeBag = DisposeBag()
    
    override func setUp() {
        httpClient = StubHTTPClient()
        self.challengeClient = ChallengeClient(httpClient: httpClient)
    }
    
    private func makeHTTPClientResult(statusCode: Int, json: String) -> Observable<Result<(Data, HTTPURLResponse), Error>> {
        return Observable.just(.success((json.data(using: .utf8)!, HTTPURLResponse(url: URL(string: "https://itunes.apple.com/search")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!)))
    }
    
    func testJSONFile() {
        let url = Bundle(for: type(of: self)).url(forResource: "search_itunes",
                                                  withExtension: "json")!
        let data = try! Data(contentsOf: url)
//        let jsonString = String(data: data, encoding: .utf8)!
        let apps = try! JSONDecoder().decode(SearchResponse<App>.self, from: data)
        let firstApp = apps.results.first
        XCTAssertEqual(apps.resultCount, 50)
        XCTAssertEqual(firstApp?.trackName, "Pikmin Bloom")
    }
    
    func testSuccess() {
        httpClient.result = makeHTTPClientResult(statusCode: 200, json: SearchResponse<App>.exampleJSON)
        
        let apiExpectation = expectation(description: "")
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        
        challengeClient.search(request: request)
            .subscribe(onNext: { result in
                switch result {
                case .success(let response):
                    let firstApp = response.results.first
                    XCTAssertEqual(firstApp?.artistName, "Niantic, Inc.")
                    XCTAssertEqual(response.resultCount, 2)
                default:
                    XCTFail("unexpected result \(result)")
                }
                apiExpectation.fulfill()
            }).disposed(by: disposeBag)
        
        wait(for: [apiExpectation], timeout: 2)
        
    }
    
    
    func testFailureByConnectionError() {
        httpClient.result = Observable.just(.failure(URLError(.cannotConnectToHost)))
        
        let apiExpectation = expectation(description: "")
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        
        challengeClient.search(request: request)
            .subscribe(onNext: { result in
                switch result {
                case .failure(.connectionError):
                    break
                default:
                    XCTFail("unexpected result \(result)")
                }
                apiExpectation.fulfill()
            }).disposed(by: disposeBag)
        
        wait(for: [apiExpectation], timeout: 2)
    }
    
    
    func testFailureByResponseParseError() {
        httpClient.result = makeHTTPClientResult(statusCode: 200, json: "{}")
        
        let apiExpectation = expectation(description: "")
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        
        challengeClient.search(request: request)
            .subscribe(onNext: { result in
                switch result {
                case .failure(.responseParseError):
                    break
                default:
                    XCTFail("unexpected result \(result)")
                }
                apiExpectation.fulfill()
            }).disposed(by: disposeBag)
        
        wait(for: [apiExpectation], timeout: 2)
    }
    
    
    func testFailureByAPIError() {
        httpClient.result = makeHTTPClientResult(statusCode: 400, json: "{}")
        
        let apiExpectation = expectation(description: "")
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        
        challengeClient.search(request: request)
            .subscribe(onNext: { result in
                switch result {
                case .failure(.challengeAPIError):
                    break
                default:
                    XCTFail("unexpected result \(result)")
                }
                apiExpectation.fulfill()
            }).disposed(by: disposeBag)
        
        wait(for: [apiExpectation], timeout: 2)
    }
    
}
