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

        configureTableView(tbContainer)
        navigationItem.title = NSLocalizedString(Title.information.rawValue, comment: "")
    }
    
    private func configureTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NameOfCells.viewControllerInformations.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformations.rawValue )
    }
}

