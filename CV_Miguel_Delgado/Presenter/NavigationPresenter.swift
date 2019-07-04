
import Foundation

class NavigationPresenter {
    func createExperiencePresenter() -> ExperiencePresenter {
        return ExperiencePresenter()
    }
    
    func createInformationPresenter() -> InformationPresenter {
        return InformationPresenter()
    }
}
