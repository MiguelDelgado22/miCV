
import UIKit

final class InformationViewController: BaseViewController {
    @IBOutlet weak var imgPhoto: UIImageView?
    @IBOutlet weak var tbContainer: UITableView?
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var presenterInformation: InformationPresenter? {
        didSet {
            presenterInformation?.delegate = self
            presenterInformation?.setInformation()
            self.tbContainer?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView(tbContainer)
        navigationItem.title = NSLocalizedString(Title.information.rawValue, comment: Comment.titleInformation.rawValue)
    }
    
    private func configureTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        activity.startAnimating()   
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NameOfCells.viewControllerInformation.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformation.rawValue )
    }
}

