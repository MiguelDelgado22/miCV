
import UIKit

extension InformationViewController: InformationPresenterDelegate {
    func errorInWebServices(error: String) {
        showAlertError(error: error)
    }
    
    func errorNotFound(error: String) {
        showAlertError(error: error)
    }
    
    func informationPersonal(response: InformationResponseModel) {
        DispatchQueue.main.async {
            self.tbContainer?.reloadData()
        }
    }
    
    func showAlertError(error: String) {
        let alert = UIAlertController(title: NSLocalizedString(AlertError.error.rawValue, comment: ""), message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:
            NSLocalizedString(AlertError.accept.rawValue, comment: ""), style: .default, handler: { action in
            self.presenterInformation?.myInformation()
        }))
        self.present(alert, animated: true)
    }
}
