//
//  ExperienceViewController.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class ExperienceViewController: BaseViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var tbContenedor: UITableView!
    
    private var presenterExperience: ExperiencePresenter?
    
    var infoExperience: [Experience]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configText()
        self.presenterExperience = ExperiencePresenter(delegate: self)
        tbContenedor.delegate = self
        tbContenedor.dataSource = self
        infoExperience = InfoService.shared.userInfo?.experience
        // Do any additional setup after loading the view.
    }
    
    func configText(){
         labelTitulo?.text  = NSLocalizedString("experience", comment: "")
    }
    

}

extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return infoExperience?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 188
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = ExperienceTableViewCell()
    tableView.register(UINib(nibName: NameOfCells.viewExperience.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewExperience.rawValue )
    cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.viewExperience.rawValue, for: indexPath) as! ExperienceTableViewCell
        
    let experience = infoExperience![indexPath.row]
    cell.updateUI(infoExperience: experience)
    cell.selectionStyle = UITableViewCell.SelectionStyle.none
    cell.backgroundColor = UIColor.clear
    return cell
    }
    
    
    
}



extension ExperienceViewController: ExperiencePresenterDelegate{
    
}
