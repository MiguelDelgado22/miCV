//
//  URLSessionTest.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

class TestURLSession: XCTestCase, TestingJSON {
    //MARK: - Testing for URLSession
    func testNetworkingSessionSuccess() {
        let service: ApiService
        let session = MockingSession()
        session.data = dataFromJSON(file: "information")
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "information.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                expectation.fulfill()
            case .fatal(error: _):
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    //MARK: - Testing for URLSession
    func testNetworkingSessionFailureDataNil() {
        let service: ApiService
        let session = MockingSession()
        session.data = nil
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "information.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                XCTFail()
            case .fatal(error: _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    //MARK: - Testing for URLSession
    func testNetworkingSessionFailureBadURL() {
        let service: ApiService
        let session = MockingSession()
        session.data = Data()
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "badURL.json"), statusCode: 404, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                XCTFail()
            case .fatal(error: _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
