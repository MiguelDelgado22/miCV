//
//  CV_Miguel_DelgadoUITests.swift
//  CV_Miguel_DelgadoUITests
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest

class CV_Miguel_DelgadoUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func test0ScreenInformation() {
        XCTAssert(app.images["imagePerfil"].exists)
        XCTAssert(app.tables.staticTexts["lbName"].exists)
        XCTAssert(app.tables.staticTexts["lbCity"].exists)
        XCTAssert(app.tables.staticTexts["lbEmail"].exists)
        XCTAssert(app.tables.staticTexts["lbBirthday"].exists)
        XCTAssert(app.tables.staticTexts["lbObjective"].exists)
        XCTAssert(app.buttons["btoExperience"].exists)
    }
    
    func test1ButtonFuntionExperience() {
        XCTAssert(app.tables.staticTexts["lbName"].exists)
        app.buttons["Experience"].tap()
        XCTAssert(app.navigationBars["Experience"].exists)
        app.navigationBars["Experience"].buttons["Information"].tap()
        XCTAssert(app.navigationBars["Information"].exists)
    }
    
    func test2CheckScreenExperience(){
        app.buttons["Experience"].tap()
        if  app.tables.cells.count == 0 {
            XCTFail()
        }
        app.tables.cells.element(boundBy: 0).swipeUp()
        app.tables.cells.element(boundBy: 3).swipeDown()
    }
}
