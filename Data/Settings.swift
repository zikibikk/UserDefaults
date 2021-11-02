import Foundation

class UserAppSettingsObject {
    
    
}

struct UserAppSettings: Codable {
    
    var phoneNumber: String
    var email: String
    var controlQuestion: String
    var notification: NotificationSettings
    
    struct NotificationSettings: Codable {
        var phoneNumber: String
        var email: String
    }
    
}
