import UIKit

extension ExperienceViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableInformationViewData.heightForRowAtExperience.rawValue)
    }
}

extension ExperienceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoExperience?.count ?? TableInformationViewData.numeroOfOptional.rawValue
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
