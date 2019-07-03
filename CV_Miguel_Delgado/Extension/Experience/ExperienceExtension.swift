//
//  ExperienceExtension.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import UIKit

extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource, ExperiencePresenterDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoExperience?.count ?? TableInformationViewData.numeroOfOptional.rawValue
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TableInformationViewData.numerOfRowInSection.rawValue
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableInformationViewData.heightForRowAtExperience.rawValue)
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
