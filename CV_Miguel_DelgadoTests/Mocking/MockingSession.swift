import Foundation
@testable import CV_Miguel_Delgado

class MockingSession: URLSessionTasking {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer { completionHandler(data, response, error) }
        return MockingDataTask(completionHandler: completionHandler)
    }
}

