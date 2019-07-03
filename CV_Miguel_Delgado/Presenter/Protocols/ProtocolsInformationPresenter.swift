//
//  ProtocolsInformationPresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol  InformationPresenterDelegate: AnyObject {
    func informationPersonal(response: InformationResponseModel)
    func errorInWebServices(error: String)
    func errorNotFound(error: String)
}
