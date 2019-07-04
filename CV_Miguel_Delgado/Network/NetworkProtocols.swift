//
//  ProtocolNetwork.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol {
    func makeRequest(from path: String, completionHandler:@escaping(_ response: ApiServiceState) -> Void)
}

protocol URLSessionTasking {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionTasking {}

