//
//  Network.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol{
    func makeRequest( with router: URLSessionTask, completionHandler:@escaping(_ response: ApiServiceState) -> Void)
}


class ApiService: ApiServiceProtocol{
    
    init() {
        
    }
    
    func makeRequest( with router: URLSessionTask, completionHandler:@escaping(_ response: ApiServiceState) -> Void){
        
        if let url = URL(string: URLPrincipal.urlPrincipal.rawValue){
            router.dataTask(with: url) { (data, response, error) in
                if let response = response as? HTTPURLResponse, let data = data {
                    if response.statusCode == NSURLErrorNotConnectedToInternet{
                        completionHandler(.notFound(reason: NSLocalizedString("No Internet", comment: "")))
                    }
                    
                    switch(response.statusCode){
                    case (HttpStatusCode.OK.rawValue ..< HttpStatusCode.OKFULL.rawValue):
                        completionHandler(.success(response: data))
                        break
                    default:
                        completionHandler(.fatal(reason: NSLocalizedString("Unexpected error", comment: "")))
                        break
                    }
                }else{
                    completionHandler(.notFound(reason: response.debugDescription))
                }
                }.resume()
        }
    }
}


