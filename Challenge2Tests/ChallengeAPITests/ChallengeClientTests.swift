//
//  ChallengeClientTests.swift
//  Challenge2Tests
//
//  Created by 石川大輔 on 2021/11/02.
//

import XCTest
@testable import Challenge2

class ChallengeClientTests: XCTestCase {
    
    var httpClient: StubHTTPClient!
    var challengeClient: ChallengeClient!
    
    override func setUp() {
        httpClient = StubHTTPClient()
        self.challengeClient = ChallengeClient(httpClient: httpClient)
    }
    
    private func makeHTTPClientResult(statusCode: Int, json: String) -> Result<(Data, HTTPURLResponse), Error> {
        return .success((json.data(using: .utf8)!, HTTPURLResponse(url: URL(string: "https://itunes.apple.com/search")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!))
    }
    
    func testSuccess() {
        httpClient.result = makeHTTPClientResult(statusCode: 200, json: SearchResponse<App>.exampleJSON)
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        let apiExpectation = expectation(description: "")
        
        challengeClient.send(request: request) { result in
            switch result {
            case .success(let response):
                let firstApp = response.results.first
                XCTAssertEqual(firstApp?.artistName, "Niantic, Inc.")
                XCTAssertEqual(response.resultCount, 2)
            default:
                XCTFail("unexpected result \(result)")
            }
            apiExpectation.fulfill()
        }
        
        wait(for: [apiExpectation], timeout: 2)
    }
    
    func testFailureByConnectionError() {
        httpClient.result = .failure(URLError(.cannotConnectToHost))
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        let apiExpectation = expectation(description: "")
        
        challengeClient.send(request: request) { result in
            switch result {
            case .failure(.connectionError):
                break
            default:
                XCTFail("unexpected result: \(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 2)
    }
    
    func testFailureByResponseParseError() {
        httpClient.result = makeHTTPClientResult(statusCode: 200, json: "{}")
        
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        let apiExpectation = expectation(description: "")
        
        challengeClient.send(request: request) { result in
            switch result {
            case .failure(.responseParseError):
                break
            default:
                XCTFail("unexpected result: \(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 2)
    }
    
    func testFailureByAPIError() {
        httpClient.result = makeHTTPClientResult(statusCode: 400, json: "{}")
        let request = ChallengeAPIRequest.SearchApps.init(keyword: "health", country: .japan, entity: .software)
        let apiExpectation = expectation(description: "")
        
        challengeClient.send(request: request) { result in
            switch result {
            case .failure(.challengeAPIError):
                break
            default:
                XCTFail("unexpected rsult: \(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 2)
    }
}
