
import UIKit

//MARK: - Strings for urls
enum StaticURL: String {
    case mainURL = "MAINURL"
}

//MARK: - Strings for cell identifier
enum NameOfCells: String {
    case viewControllerInformations = "LabelsTableViewCell"
    case viewExperience = "experienceTableViewCell"

}

//MARK: - String for images
enum NameOfImage: String {
    case IMG_BACKGROUND_SCREEN = "background"
}

//MARK: - Values for tableview information
enum TableInformationViewData: Int {
    case numeroOfOptional = 0
    case numerOfRowInSection = 1
    case heightForRowAt = 238
    case heightForRowAtExperience = 188
}

//MARK: - Values for a base positions
enum BaseData: Double {
    case alphaNum = 0.5
    case positionXYcontentView = 0.0
    case labelPositionX = 16.0
    case labelPositionY = 34.0
    case labelPositionWith = 343.0
    case labelPositionHeigth = 63.0
}

//MARK: - Values for size of fonts
enum SizeFont: Double {
    case fontBase = 23.0
}

//MARK: - Status for api service
enum ApiServiceState {
    case fatal(error: Error)
    case success(data: Data)
}

//MARK: - Values for http status code response
enum HttpStatusCode: Int {
    case OK = 200
    case OKFULL = 300
}

//MARK: - Strings for alert controller
enum AlertError: String {
    case error = "error"
    case accept = "Reload"
    case again = "repeat"
    case notInternet = "tryAgain"
}

//MARK: - Strings for titles
enum Title: String {
    case information = "information"
    case experience = "experience"
}

//MARK: Enum network error handler
enum ApiServiceError: Error {
    case uncategorized
    case badUrl
    case noData
    case noResponse
}

//MARK: - Get strings from xconfig files
enum Config {
    static func setUrlAsString(for key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}

//MARK: - Enum for the names of the storyboards
enum Storyboard: String {
    case main = "Main"
}

//MARK: - Enum for the names of the controllers
enum Controller: String {
    case navigationController = "NavigationController"
}

//MARK: - Strings for the comment at localized
enum Comment: String {
    case titleInformation = "Title information"
    case  error = "Error alert"
    case messageError = "Message of error"
    case accept = "Accept action"
    case titleExperience = "Title experience"
}
