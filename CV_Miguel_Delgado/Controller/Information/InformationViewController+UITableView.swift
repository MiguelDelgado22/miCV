
import UIKit

extension InformationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableInformationViewData.numerOfRowInSection.rawValue
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

extension InformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableInformationViewData.heightForRowAt.rawValue)
    }
}