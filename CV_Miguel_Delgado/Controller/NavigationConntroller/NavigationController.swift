//
//  NavigationController.swift
//  CV_Miguel_Delgado
//
//  Created by David Castro Cisneros on 7/3/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let controller = viewController as? InformationViewController,
            controller.presenterInformation == nil {
            
            controller.presenterInformation = InformationPresenter()
        }
        
        if let controller = viewController as? ExperienceViewController,
            controller.presenterExperience == nil {
            controller.presenterExperience = ExperiencePresenter()
        }
    }
}
