//
//  Settings.swift
//  Data
//
//  Created by Alina Bikkinina on 02.11.2021.
//

import Foundation

class UserAppSettingsObject {
    
    
}

struct UserAppSettings: Codable {
    
    var phoneNumber: String
    var email: String
    var controlQuestion: String
    
    init( phoneNumber: String, email: String, controlQuestion: String) {
        self.phoneNumber = phoneNumber
        self.controlQuestion = controlQuestion
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phoneNumber"
        case email = "email"
        case controlQuestion = "controlQuestion"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(controlQuestion, forKey: .controlQuestion)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.controlQuestion = try container.decode(String.self, forKey: .controlQuestion)
    }
    
}
