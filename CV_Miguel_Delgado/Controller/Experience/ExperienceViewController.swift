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

    private var presenterExperience: ExperiencePresenter?

    var infoExperience: [Experience]?

    override func viewDidLoad() {
        super.viewDidLoad()
       guard let tbcontenedor = tbContenedor else {
            return
        }
        configText()
        self.presenterExperience = ExperiencePresenter(delegate: self)
        tbcontenedor.delegate = self
        tbcontenedor.dataSource = self
        tbcontenedor.register(UINib(nibName: NameOfCells.viewExperience.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewExperience.rawValue )
    }

    func configText() {
         labelTitulo?.text  = NSLocalizedString(Title.experience.rawValue, comment: "")
    }
}
