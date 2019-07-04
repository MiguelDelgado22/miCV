
import Foundation

protocol  InformationPresenterDelegate: AnyObject {
    func informationPersonal(response: InformationResponseModel)
    func errorInWebServices(error: String)
    func errorNotFound(error: String)
}
