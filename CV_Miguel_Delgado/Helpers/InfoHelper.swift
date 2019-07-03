//
//  InfoHelpers.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/28/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class InfoHelper: NSObject {
    // MARK: My info method
    /**
     Get a DownloadResult
     
     - parameters:
     - completionHandler: A closure that need be defined by the caller to manipulate the data
     */
    func myInfo(completionHandler: @escaping(DownloadResult) -> Void) {
        ApiService().makeRequest(with: URLSession.shared) { (response) in
            switch response {
            case .success(let data):
                completionHandler(.success(data:data))
                break
            case .fatal(let fatal):
                completionHandler(.fatal(error: fatal))
                break
            case .notFound(let notFound):
                completionHandler(.notFound(error: notFound))
            default:
                break
            }
        }
    }
}
