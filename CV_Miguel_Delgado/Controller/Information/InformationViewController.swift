
import UIKit

final class InformationViewController: BaseViewController {
    @IBOutlet weak var imgPhoto: UIImageView?
    @IBOutlet weak var tbContainer: UITableView?
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var presenterInformation: InformationPresenter? {
        didSet {
            presenterInformation?.delegate = self
            presenterInformation?.myInformation()
            self.tbContainer?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView(tbContainer)
        navigationItem.title = NSLocalizedString(Title.information.rawValue, comment: "")
    }
    
    private func configureTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        activity.startAnimating()   
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NameOfCells.viewControllerInformations.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformations.rawValue )
    }
}

