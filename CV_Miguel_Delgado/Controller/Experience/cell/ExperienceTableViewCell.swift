//
//  experienceTableViewCell.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbRole: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(infoExperience: Experience) {
        self.lbName.text = infoExperience.name
        self.lbDate.text = infoExperience.date
        self.lbRole.text = infoExperience.role
        self.lbDescription.text = infoExperience.descripcion
        self.img.image = UIImage(named: infoExperience.image)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
