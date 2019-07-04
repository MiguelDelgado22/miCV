//
//  Network.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class ApiService: ApiServiceProtocol {
    let session: URLSessionTasking
    var task: URLSessionDataTask?
    
    // MARK: Init Api service
    init(session: URLSessionTasking = URLSession.shared) {
        self.session = session
    }
    
    // MARK: Make a request method
    /**
     Get the data from main url
     
     - parameters:
     - router: A URLSessionTask
     - completitionHandler: A closure that need be defined by the caller to manipulate the data
     */
    func makeRequest(from path: String = Config.setUrlAsString(for: StaticURL.mainURL.rawValue) ?? "", completionHandler:@escaping(_ response: ApiServiceState) -> Void) {
        if let url = URL(string: path) {
            task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == HttpStatusCode.OK.rawValue {
                        if let data = data {
                            completionHandler(.success(response: data))
                        } else {
                            completionHandler(.success(response: Data()))
                        }
                    } else {
                        guard let error = error else { return }
                        completionHandler(.fatal(error: error))
                    }
                } else {
                    guard let error = error else { return }
                    completionHandler(.fatal(error: error))
                }
            })
            task?.resume()
        }
    }
    
//    func downloadImage( with router: URLSessionTasking, urlDownload: URL, completionHandler:@escaping(_ response: ApiServiceState) -> Void){
//        router.dataTask(with: urlDownload) { (data, response, error) in
//            if let response = response as? HTTPURLResponse, let data = data{
//                if response.statusCode == NSURLErrorNotConnectedToInternet {
//                    completionHandler(.notFound(reason: NSLocalizedString(NetworkError.notConnection.rawValue, comment: "")))
//                }
//                
//                switch(response.statusCode){
//                     case (HttpStatusCode.OK.rawValue ..< HttpStatusCode.OKFULL.rawValue):
//                        completionHandler(.success(response: data))
//                    break
//                default:
//                    completionHandler(.fatal(reason: NSLocalizedString(NetworkError.unexpected.rawValue, comment: "")))
//                    break
//                }
//                
//            } else {
//                completionHandler(.notFound(reason: response.debugDescription))
//            }
//        }.resume()
//    }
    
}
