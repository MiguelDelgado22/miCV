
import Foundation

final class ExperiencePresenter {
    private var infoExperience: [Experience]?
    var experienceAmount: Int {
        return infoExperience?.count ?? 0
    }
    
    func getExperience(at index: Int) -> Experience? {
        return infoExperience?[index]
    }
    
    func setExperience(_ experiences: [Experience]?) {
        self.infoExperience = experiences
    }
}
