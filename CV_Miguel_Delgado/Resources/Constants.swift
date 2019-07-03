//
//  Constants.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import UIKit

enum URLPrincipal: String {
    case urlPrincipal = "https://gist.githubusercontent.com/MiguelDelgado22/47dad348488891b1d5fba23b41b25b04/raw/0c139c35260824723a1b52df21f3a48447f62573/MyCV"
}

enum NameOfCells: String {
    case viewControllerInformations = "LabelsTableViewCell"
    case viewExperience = "experienceTableViewCell"

}

enum NameOfImage: String {
    case IMG_BACKGROUND_SCREEN = "background"
}

enum TableInformationViewData: Int {
    case numeroOfOptional = 0
    case numerOfRowInSection = 1
    case heightForRowAt = 238
    case heightForRowAtExperience = 188
}

enum BaseData: Double {
    case alphaNum = 0.5
    case positionXYcontentView = 0.0
    case labelPositionX = 16.0
    case labelPositionY = 34.0
    case labelPositionWith = 343.0
    case labelPositionHeigth = 63.0
}

enum sizeFont: Double {
    case fontBase = 23.0
}

enum ApiServiceState: Error {
    case network(error: Error)
    case notFound(reason: String)
    case fatal(reason: String)
    case success(response: Data)
}

enum HttpStatusCode: Int {
    case OK = 200
    case OKFULL = 300
}

enum DownloadResult {
    case success(data: Data)
    case notFound(error: String)
    case fatal(error: String)
}

enum AlertError: String {
    case error = "Error"
    case acept = "OK"
    case again = "Vuelva a intentarlo"
    case internet = "Sin Internet"
}
