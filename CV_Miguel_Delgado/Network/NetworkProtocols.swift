//
//  ProtocolNetwork.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol MockConnectionProtocol: ApiServiceProtocol {
    func successTest(completionHandler: @escaping (ApiServiceState) -> Void)
    func failTest(completionHandler: @escaping (ApiServiceState) -> Void)
}

protocol ApiServiceProtocol {
    func makeRequest( with router: URLSessionTask, completionHandler:@escaping(_ response: ApiServiceState) -> Void)
}

protocol URLSessionTask {
func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionTask {}
