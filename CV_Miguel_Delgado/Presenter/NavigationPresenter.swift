import Foundation

class NavigationPresenter {
    func createExperiencePresenter(from presenter: InformationPresenter?) -> ExperiencePresenter {
        guard let presenter = presenter else {
            return ExperiencePresenter()
        }
        
        let informationPresenter = ExperiencePresenter()
        informationPresenter.setExperience(presenter.getExperiences())
        
        return informationPresenter
    }
    
    func createInformationPresenter() -> InformationPresenter {
        return InformationPresenter()
    }
}
