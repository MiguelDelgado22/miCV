//
//  InfoHelpers.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/28/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class InfoHelper: NSObject {
    private let service: ApiService
    
    init(_ service: ApiService = ApiService()) {
        self.service = service
    }
    
    // MARK: My info method
    /**
     Get a DownloadResult
     
     - parameters:
     - completionHandler: A closure that need be defined by the caller to manipulate the data
     */
    func myInfo(completionHandler: @escaping(ApiServiceState) -> Void) {
        service.makeRequest { (response) in
            switch response {
            case .success(let data):
                completionHandler(.success(data:data))
            case .fatal(let fatal):
                completionHandler(.fatal(error: fatal))
            }
        }
    }
    
    func downloadImg(urlImage: String, completionHandler: @escaping(ApiServiceState) -> Void){
        service.makeRequest(from: urlImage) { (response) in
            switch response {
            case .success(let data):
                completionHandler(.success(data:data))
            case .fatal(let fatal):
                completionHandler(.fatal(error: fatal))
            }
        }
    }
}
