//
//  TestDecoding.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Fernando De La Rosa Salas on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

class TestDecoding: XCTestCase, TestingJSON {
    // MARK: Parse method testing
    func testParseDataFromValidJSON() {
        var parseData: InformationResponseModel?
        let data = dataFromJSON(file: "information")
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNotNil(parseData)
    }
    
    func testParseDataFromInvalidJSON() {
        var parseData: InformationResponseModel?
        let data = dataFromJSON(file: "corruptInformation")
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNil(parseData)
    }
    
    func testParseNilData() {
        var parseData: InformationResponseModel?
        let data = Data()
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNil(parseData)
    }
}
