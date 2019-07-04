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
            self.activity.isHidden = true
            self.tbContainer?.reloadData()
        }
    }
    
    func showAlertError(error: String) {
        let alert = UIAlertController(title: NSLocalizedString(AlertError.error.rawValue, comment: ""), message: NSLocalizedString(error, comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:
            NSLocalizedString(AlertError.accept.rawValue, comment: ""), style: .default, handler: { action in
             self.activity.isHidden = false
            self.presenterInformation?.myInformation()
        }))
        self.present(alert, animated: true)
    }
}
