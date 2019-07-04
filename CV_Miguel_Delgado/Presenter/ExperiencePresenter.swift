//
//  ExperiencePresenter.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class ExperiencePresenter {
    private var infoExperience: [Experience]?
    var experienceAmount: Int {
        return infoExperience?.count ?? 0
    }
    
    func getExperience(at index: Int) -> Experience? {
        return infoExperience?[index]
    }
    
    func setExperience(_ experiences: [Experience]?) {
        self.infoExperience = experiences
    }
}
