//
//  TestPresenter.swift
//  CV_Miguel_DelgadoTests
//
//  Created by David Castro Cisneros on 7/4/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

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
        let testingJSON = dataFromJSON(file: "information")
        let session = MockingSession()
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        session.data = testingJSON
        session.error = nil
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        informationPresenter.myInformation(ApiService(session: session))
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        
        XCTAssertNotNil(experiencePresenter)
        XCTAssertNotNil(experiencePresenter.getExperience(at: 0))
        XCTAssertEqual("Planet Media", experiencePresenter.getExperience(at: 0)?.name)
    }
}