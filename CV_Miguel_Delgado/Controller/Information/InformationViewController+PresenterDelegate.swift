
import UIKit

extension InformationViewController: InformationPresenterDelegate {
    func errorInWebServices(error: String) {
        showAlertError(error: error)
    }
    
    func errorNotFound(error: String) {
        showAlertError(error: error)
    }
    
    func informationPersonal(response: InformationResponseModel) {
        responseInfo = response
        pastDataOfNextTab()
        DispatchQueue.main.async {
            self.tbContainer?.reloadData()
        }
    }
    
    func showAlertError(error: String) {
        let alert = UIAlertController(title: NSLocalizedString(AlertError.error.rawValue, comment: ""), message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(AlertError.acept.rawValue, comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
