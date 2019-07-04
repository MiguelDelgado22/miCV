//
//  URLSessionTest.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

class TestURLSession: XCTestCase {
    //MARK: - Testing for URLSession
    func testNetworkingSessionSuccess() {
        let service: ApiService
        let session = MockingSession()
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "information.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(response: _):
                expectation.fulfill()
            case .fatal(error: _):
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
