//
//  ViewController.swift
//  Data
//
//  Created by Alina Bikkinina on 02.11.2021.
//

import UIKit

enum UserDefaultsKeys {
    static let phoneNumber = "phoneNumber"
    static let email = "email"
    static let controlQuestion = "controlQuestion"
    static let userSettings = "userSettings"
}

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        userDefaults.set("8909", forKey: UserDefaultsKeys.phoneNumber)
//        userDefaults.set("ema", forKey: UserDefaultsKeys.email)
//        userDefaults.set("mama", forKey: UserDefaultsKeys.controlQuestion)
        
        let userSettings = UserAppSettings(phoneNumber: "8909", email: "ema", controlQuestion: "mama")
        let encoder = JSONEncoder()
        let encodeUserSettings = try? encoder.encode(userSettings)
        userDefaults.set(encodeUserSettings, forKey: UserDefaultsKeys.userSettings)
        print(userSettings)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let phoneNumber = userDefaults.string(forKey: UserDefaultsKeys.phoneNumber)
        let userData = userDefaults.value(forKey: UserDefaultsKeys.userSettings) as! Data
        let decoder = JSONDecoder()
        let userAppSettingsData = try! decoder.decode(UserAppSettings.self, from: userData)
        print(userAppSettingsData)
    }


}

