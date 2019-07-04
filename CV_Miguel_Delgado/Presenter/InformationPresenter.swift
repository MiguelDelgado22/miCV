//
//  InformationPresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class InformationPresenter {
    weak var delegate: InformationPresenterDelegate?
    private var responseInfo: InformationResponseModel?
    
    func myInformation() {
        InfoHelper().myInfo { (responseData) in
            switch responseData {
            case .success(let dataResponse):
                if let myInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: dataResponse) {
                    self.responseInfo = myInfo
                    self.delegate?.informationPersonal(response: myInfo)
                }
            case .fatal:
                self.delegate?.errorInWebServices(error: AlertError.again.rawValue)
            }
        }
    }
    
    func getInformation() -> InformationResponseModel? {
        return responseInfo
    }
}
