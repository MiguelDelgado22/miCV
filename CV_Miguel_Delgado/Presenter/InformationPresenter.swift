//
//  InformationPresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class InformationPresenter {

    weak private var delegate: InformationPresenterDelegate?

    init(delegate: InformationPresenterDelegate) {
        self.delegate = delegate
    }

    func myInformation() {
        InfoHelper().myInfo { (responseData) in
            switch responseData {
            case .success(let dataResponse):
                if let myInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: dataResponse){
                 self.delegate?.informationPersonal(response: myInfo)
                }
                break
            case .fatal:
                self.delegate?.errorInWebServices(error: AlertError.again.rawValue)
                break
            case .notFound:
                self.delegate?.errorNotFound(error: AlertError.notInternet.rawValue)
            }
        }

    }

}
