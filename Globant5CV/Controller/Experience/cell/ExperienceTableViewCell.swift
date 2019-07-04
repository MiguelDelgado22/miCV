
import UIKit

final class ExperienceTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbDate: UILabel?
    @IBOutlet weak var lbRole: UILabel?
    @IBOutlet weak var lbDescription: UILabel?
    @IBOutlet weak var img: UIImageView?

    func updateUI(infoExperience: Experience) {
        self.lbName?.text = infoExperience.name
        self.lbDate?.text = infoExperience.date
        self.lbRole?.text = infoExperience.role
        self.lbDescription?.text = infoExperience.descripcion
        
        InfoHelper().getDownloadImg(urlImage: infoExperience.image) { [weak self] (response) in
            switch response{

            case .success(let data):
                DispatchQueue.main.async() { [weak self] in
                    self?.img?.image = UIImage(data: data)
                }
                break
            default:
                break
            }
        }
    }
}
