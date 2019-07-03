//
//  InformationViewController.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class InformationViewController: BaseViewController {
    @IBOutlet weak var imgPhoto: UIImageView?
    @IBOutlet weak var tbContainer: UITableView?

    private var presenterInformation: InformationPresenter?

    var responseInfo: InformationResponseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configText()
        self.presenterInformation = InformationPresenter(delegate: self)
        presenterInformation?.myInformation()
        tbContainer?.delegate = self
        tbContainer?.dataSource = self
    }
    
    func configText() {
       labelTitulo?.text = NSLocalizedString(Title.information.rawValue, comment: "")
    }
    
    func pastDataOfNextTab() {
        if let secondTab = self.tabBarController?.viewControllers?[1] as? ExperienceViewController {
            secondTab.infoExperience = responseInfo?.experience
        }
    }
}

