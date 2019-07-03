//
//  MockingProtocols.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import XCTest
@testable import CV_Miguel_Delgado

protocol MockConnectionProtocol: ApiServiceProtocol {
    func successTest(completionHandler: @escaping (ApiServiceState) -> Void)
    func failTest(completionHandler: @escaping (ApiServiceState) -> Void)
}
