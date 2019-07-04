//
//  Constants.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

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
enum ApiServiceState: Error {
    case network(error: Error)
    case notFound(reason: String)
    case fatal(reason: String)
    case success(response: Data)
}

//MARK: - Values for http status code response
enum HttpStatusCode: Int {
    case OK = 200
    case OKFULL = 300
}

//MARK: - Status for download result
enum DownloadResult {
    case success(data: Data)
    case notFound(error: String)
    case fatal(error: String)
}

//MARK: - Strings for alert controller
enum AlertError: String {
    case error = "error"
    case accept = "Reload"
    case again = "repeat"
    case notInternet = "Please, try again."
}

//MARK: - Strings for titles
enum Title: String {
    case information = "information"
    case experience = "experience"
}

//MARK: - Strings for network errors
enum NetworkError: String {
    case notConnection = "notConnection"
    case unexpected = "unexpected"
}

//MARK: - Get strings from xconfig files
enum Config {
    static func setUrlAsString(for key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}
