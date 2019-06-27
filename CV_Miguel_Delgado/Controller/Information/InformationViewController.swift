//
//  InformationViewController.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class InformationViewController: BaseViewController {
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var tbContainer: UITableView!
    
    private var presenterInformation: InformationPresenter?
    
    var responseInfo: InformationResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configText()
        self.presenterInformation = InformationPresenter(delegate: self)
        tbContainer.delegate = self
        tbContainer.dataSource = self
        presenterInformation?.myInformation()
        
        // Do any additional setup after loading the view.
    }
    
    func configText(){
       labelTitulo?.text = NSLocalizedString("titulo", comment: "")
    }
}




//MARK: DELEGATE OF PRESENTER
extension InformationViewController: InformationPresenterDelegate{
    func informationPersonal(response: InformationResponseModel) {
        responseInfo = response
        tbContainer.reloadData()
    }
    
    
    
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 238
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = LabelsTableViewCell()
        tableView.register(UINib(nibName: NameOfCells.viewControllerInformations.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformations.rawValue )
        cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.viewControllerInformations.rawValue, for: indexPath) as! LabelsTableViewCell
        
        cell.lbName.text = responseInfo?.name
        cell.lbCity.text = responseInfo?.city
        cell.lbNumber.text = responseInfo?.telephoneNumber
        cell.lbEmail.text = responseInfo?.email
        cell.lbBirthday.text = responseInfo?.birthday
        cell.lbObjective.text = responseInfo?.objective
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}
