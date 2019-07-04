//
//  TestNetwork.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

class TestNetwork: XCTestCase {
    //MARK: - Testing networking layer
    func testValidURLRequest() {
        let service: ApiService
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        let session = MockingSession()
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Request Service")
        service = ApiService(session: session)
        
        service.makeRequest(from: validURL) { (response) in
            switch response {
            case .success(response: _):
                expectation.fulfill()
            default:
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
