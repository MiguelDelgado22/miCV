import XCTest
@testable import CV_Miguel_Delgado

class TestURLSession: XCTestCase, TestingJSON {
    //MARK: - Testing for URLSession
    func testNetworkingSessionSuccess() {
        let service: ApiService
        let session = MockingSession()
        session.data = dataFromJSON(file: "information")
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "information.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Test a correct URLSession")
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
    
    func testNetworkingSessionFailureDataNil() {
        let service: ApiService
        let session = MockingSession()
        session.data = nil
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "information.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Test a incorrect URLSession with data nil")
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
    
    func testNetworkingSessionFailureBadURL() {
        let service: ApiService
        let session = MockingSession()
        session.data = Data()
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "badURL.json"), statusCode: 404, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: "Test a incorrect URLSession with an invalid URL")
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
    
    func testNetworkingSessionFailureNoResponse() {
        let service: ApiService
        let session = MockingSession()
        
        let expectation = XCTestExpectation(description: "Test a incorrect URLSession without response")
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
