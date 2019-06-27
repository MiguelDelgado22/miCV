//
//  LabelsTableViewCell.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class LabelsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCity: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbBirthday: UILabel!
    @IBOutlet weak var lbObjective: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
