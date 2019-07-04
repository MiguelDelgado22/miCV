//
//  ProtocolsTest.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

protocol TestingJSON {
    func dataFromJSON(of file: String) -> Data
}

protocol TestingModel {
    var information: InformationResponseModel {get set}
}

extension TestingJSON where Self: XCTestCase {
    func dataFromJSON(file: String) -> Data {
        guard let url = Bundle(for: type(of: self)).url(forResource: file, withExtension: "json") else { return Data() }
        guard let data  = try? Data(contentsOf: url) else { return Data()}
        return data
    }
}
