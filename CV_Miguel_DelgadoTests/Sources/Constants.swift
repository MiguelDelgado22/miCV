import Foundation

//MARK: - Enum for extension of sources files
enum TypeFile: String {
    case json = "json"
}

//MARK: - Enum for the name of the sources files
enum SourceFile: String {
    case information = "information"
    case corruptInformation = "corruptInformation"
}

//MARK: - Enum for XCTestExpectation description
enum ExpectationDescription: String {
    case testValidURLRequest = "Test request service valid URL"
    case testInvalidURLRequest = "Test request service invalid URL"
    case testNOInternetConnection = "Test request service no internet connection"
    case testNetworkingSessionSuccess = "Test a correct URLSession"
    case testNetworkingSessionFailureDataNil = "Test a incorrect URLSession with data nil"
    case testNetworkingSessionFailureBadURL = "Test a incorrect URLSession with an invalid URL"
    case testNetworkingSessionFailureNoResponse = "Test a incorrect URLSession without response"
}

//MARK: - Enum for file with extension
enum Files: String {
    case correctURL = "information.json"
    case badURL = "badURL.json"
}
