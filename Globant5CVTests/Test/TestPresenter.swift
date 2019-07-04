import XCTest
@testable import Globant5CV

class TestPresenter: XCTestCase, TestingJSON {
    func testPresenterCreation() {
        let navigationPresenter = NavigationPresenter()
        XCTAssertNotNil(navigationPresenter)
        
        let informationPresenter = InformationPresenter()
        XCTAssertNotNil(informationPresenter)
        
        let experiencePresenter = ExperiencePresenter()
        XCTAssertNotNil(experiencePresenter)
    }
    
    func testPresenterCreationFromNavigationPresenter() {
        let navigationPresenter = NavigationPresenter()
        
        let informationPresenter = navigationPresenter.createInformationPresenter()
        XCTAssertNotNil(informationPresenter)
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        
        XCTAssertNotNil(experiencePresenter)
        XCTAssertNil(experiencePresenter.getExperience(at: 0))
    }
    
    func testModelExperienceInjection() {
        let navigationPresenter = NavigationPresenter()
        let informationPresenter = navigationPresenter.createInformationPresenter()
        let testingJSON = dataFromJSON(file: SourceFile.information.rawValue)
        let session = MockingSession()
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        session.data = testingJSON
        session.error = nil
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        informationPresenter.setInformation(ApiService(session: session))
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        
        XCTAssertNotNil(experiencePresenter)
        XCTAssertNotNil(experiencePresenter.getExperience(at: 0))
        XCTAssertEqual("Planet Media", experiencePresenter.getExperience(at: 0)?.name)
    }
}
