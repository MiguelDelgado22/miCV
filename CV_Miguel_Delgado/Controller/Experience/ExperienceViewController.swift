//
//  ExperienceViewController.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class ExperienceViewController: BaseViewController {
    @IBOutlet weak var tbContenedor: UITableView?
    var presenterExperience: ExperiencePresenter? {
        didSet {
            self.tbContenedor?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView(tbContenedor)
        
        navigationItem.title = NSLocalizedString(Title.experience.rawValue, comment: "")
    }
    
    func configureTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NameOfCells.viewExperience.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewExperience.rawValue )
    }
}

