import Foundation

class InformationPresenter {
    weak var delegate: InformationPresenterDelegate?
    private var responseInfo: InformationResponseModel?
    
    func myInformation(_ service: ApiService = ApiService()) {
        InfoHelper(service).myInfo { (responseData) in
            switch responseData {
            case .success(let dataResponse):
                if let myInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: dataResponse) {
                    self.responseInfo = myInfo
                    self.delegate?.informationPersonal(response: myInfo)
                }
            case .fatal:
                self.delegate?.errorInWebServices(error: AlertError.notInternet.rawValue)
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
