import UIKit

extension ExperienceViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableInformationViewData.heightForRowAtExperience.rawValue)
    }
}

extension ExperienceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterExperience?.infoExperience?.count ?? TableInformationViewData.numeroOfOptional.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.viewExperience.rawValue, for: indexPath) as?  ExperienceTableViewCell,
            let experience = presenterExperience?.infoExperience?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.updateUI(infoExperience: experience)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
}
