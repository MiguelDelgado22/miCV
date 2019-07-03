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
<<<<<<< HEAD
    var presenterExperience: ExperiencePresenter? {
        didSet {
            self.presenterExperience?.infoExperience = (self.navigationController?.viewControllers.first as? InformationViewController)?.presenterInformation?.responseInfo?.experience
            print(self.presenterExperience)
            self.tbContenedor?.reloadData()
        }
    }
    
=======

    private var presenterExperience: ExperiencePresenter?

    var infoExperience: [Experience]?
    var dataImageDownload: Data?
>>>>>>> Fix: image download
    override func viewDidLoad() {
        super.viewDidLoad()
       guard let tbcontenedor = tbContenedor else {
            return
        }
        
        tbcontenedor.register(UINib(nibName: NameOfCells.viewExperience.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewExperience.rawValue )
        
        tbcontenedor.delegate = self
        tbcontenedor.dataSource = self
    navigationItem.title = NSLocalizedString(Title.experience.rawValue, comment: "")
        

    }
}
