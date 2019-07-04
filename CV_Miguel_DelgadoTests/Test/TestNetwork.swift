//
//  TestNetwork.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

class TestNetwork: XCTestCase, TestingJSON {
    //MARK: - Testing networking layer
    func testValidURLRequest() {
        let service: ApiService
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        let session = MockingSession()
        session.data = dataFromJSON(file: "information")
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Request service valid URL")
        service = ApiService(session: session)
        
        service.makeRequest(from: validURL) { (response) in
            switch response {
            case .success(data: _):
                expectation.fulfill()
            case .fatal(error: _):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testInvalidURLRequest() {
        let service: ApiService
        let invalidURL = StaticURL.invalidURL.rawValue
        guard let url = URL(string: invalidURL) else { return }
        
        let session = MockingSession()
        session.response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Request service invalid URL")
        service = ApiService(session: session)
        
        service.makeRequest(from: invalidURL) { (response) in
            switch response {
            case .fatal(error: _):
                expectation.fulfill()
            case .success(data: _):
                XCTFail()            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNOInternetConnection() {
        let service: ApiService
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        let session = MockingSession()
        session.response = HTTPURLResponse(url: url, statusCode: 0, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Request service no internet connection")
        service = ApiService(session: session)
        
        service.makeRequest(from: validURL) { (response) in
            switch response {
            case .fatal(error: _):
                expectation.fulfill()
            case .success(data: _):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
