//
//  ExperiencePresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

protocol  ExperiencePresenterDelegate: AnyObject {

}

class ExperiencePresenter {

    weak private var delegate: ExperiencePresenterDelegate?

    init(delegate: ExperiencePresenterDelegate) {
        self.delegate = delegate
    }

}
