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
        
        let userSettings = UserAppSettings(phoneNumber: "8909", email: "ema", controlQuestion: "mama", notification: .init(phoneNumber: "999", email: "maile"))
        let encoder = JSONEncoder()
        let encodeUserSettings = try? encoder.encode(userSettings)
        userDefaults.set(encodeUserSettings, forKey: UserDefaultsKeys.userSettings)
        print(userSettings)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let userData = userDefaults.value(forKey: UserDefaultsKeys.userSettings) as! Data
        let decoder = JSONDecoder()
        let userAppSettingsData = try! decoder.decode(UserAppSettings.self, from: userData)
        print(userAppSettingsData)
        
        
    }


}

