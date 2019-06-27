//
//  InformationPresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol  InformationPresenterDelegate: AnyObject{
    func informationPersonal(response: InformationResponseModel)
    
}


class InformationPresenter{
    
    weak private var delegate: InformationPresenterDelegate?
    
    init(delegate: InformationPresenterDelegate){
        self.delegate = delegate
    }
    
    func myInformation(){
        if let path = Bundle.main.path(forResource: "Information", ofType: "json"){
            do {
                let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let myInfo = try! JSONDecoder().decode(InformationResponseModel.self, from: data)
                self.delegate?.informationPersonal(response: myInfo)
                InfoService.shared.userInfo = myInfo
                print(myInfo)
            }
        }
        
    }
    
    
}
