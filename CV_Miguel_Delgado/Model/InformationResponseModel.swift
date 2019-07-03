//
//  InformationResponseModel.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/26/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation

class InformationResponseModel: Codable {

    var name: String = ""
    var city: String = ""
    var telephoneNumber: String = ""
    var email: String = ""
    var birthday: String = ""
    var objective: String = ""
    var education: [Education]?
    var experience: [Experience]?

    private enum CodingKeys: String, CodingKey {
        case name
        case city
        case telephoneNumber
        case email
        case birthday
        case objective
        case education
        case experience
    }
}

class Education: Codable {
    var university: String = ""
    var date: String = ""

    private enum CodingKeys: String, CodingKey {
        case university
        case date
    }
}

class Experience: Codable {
    var name: String = ""
    var date: String = ""
    var role: String = ""
    var descripcion: String = ""
    var image: String = ""

    private enum CodingKeys: String, CodingKey {
        case name
        case date
        case role
        case descripcion
        case image
    }
}
