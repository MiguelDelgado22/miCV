
import Foundation

final class InformationPresenter {
    weak var delegate: InformationPresenterDelegate?
    private var responseInfo: InformationResponseModel?
    
    func setInformation(_ service: ApiService = ApiService()) {
        InfoHelper(service).getInfo { [weak self] (responseData) in

            switch responseData {
            case .success(let dataResponse):
                if let myInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: dataResponse) {
                    self?.responseInfo = myInfo
                    self?.delegate?.informationPersonal(response: myInfo)
                }
            case .fatal:
                self?.delegate?.errorInWebServices(error: AlertError.again.rawValue)
            }
        }
    }
    
    func getInformation() -> InformationResponseModel? {
        return responseInfo
    }
    
    func getExperiences() -> [Experience]? {
        return getInformation()?.experience
    }
}

