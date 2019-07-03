//
//  InformationExtension.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import UIKit

//MARK: DELEGATE OF PRESENTER
extension InformationViewController: InformationPresenterDelegate{
    func errorInWebServices(error: String) {
        showAlertError(error: error)
    }
    
    func errorNotFound(error: String) {
       showAlertError(error: error)
    }
    
    func informationPersonal(response: InformationResponseModel) {
        responseInfo = response
        pastDataOfNextTab()
        DispatchQueue.main.async {
            self.tbContainer?.reloadData()
        }
    }
    
    func showAlertError(error: String){
        let alert = UIAlertController(title: NSLocalizedString(AlertError.error.rawValue, comment: ""), message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(AlertError.acept.rawValue, comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true)
    }
 
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableInformationViewData.numerOfRowInSection.rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableInformationViewData.numerOfRowInSection.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableInformationViewData.heightForRowAt.rawValue)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = LabelsTableViewCell()
        tableView.register(UINib(nibName: NameOfCells.viewControllerInformations.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformations.rawValue )
        cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.viewControllerInformations.rawValue, for: indexPath) as! LabelsTableViewCell
        cell.updateUI(responseInformation: responseInfo)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
}

extension InformationViewController{
    func pastDataOfNextTab(){
        if let secondTab = self.tabBarController?.viewControllers?[1] as? ExperienceViewController{
            secondTab.infoExperience = responseInfo?.experience
        }
    }
}
