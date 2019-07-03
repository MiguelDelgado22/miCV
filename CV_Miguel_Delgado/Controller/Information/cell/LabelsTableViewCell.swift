//
//  LabelsTableViewCell.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class LabelsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbCity: UILabel?
    @IBOutlet weak var lbNumber: UILabel?
    @IBOutlet weak var lbEmail: UILabel?
    @IBOutlet weak var lbBirthday: UILabel?
    @IBOutlet weak var lbObjective: UILabel?

    func updateUI(responseInformation: InformationResponseModel?) {
        lbName?.text = responseInformation?.name
        lbCity?.text = responseInformation?.city
        lbNumber?.text = responseInformation?.telephoneNumber
        lbEmail?.text = responseInformation?.email
        lbBirthday?.text = responseInformation?.birthday
        lbObjective?.text = responseInformation?.objective
    }

}
