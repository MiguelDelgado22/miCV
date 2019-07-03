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

    var presenterInformation: InformationPresenter? {
        didSet {
            presenterInformation?.delegate = self
            presenterInformation?.myInformation()
            self.tbContainer?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tbContainer = tbContainer else {
            return
        }
        
        tbContainer.register(UINib(nibName: NameOfCells.viewControllerInformations.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformations.rawValue )
        tbContainer.delegate = self
        tbContainer.dataSource = self
        
        navigationItem.title = NSLocalizedString(Title.information.rawValue, comment: "")
    }
}

