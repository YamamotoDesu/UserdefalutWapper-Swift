import Foundation

@propertyWrapper
struct UserDefaultsWrapper<Value> {
    let key: String
    let defaultValue: Value
    let userDefaults: UserDefaults = .standard
    
    var wrappedValue: Value{
        get {
            return userDefaults.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefaultsWrapper(key: "com.user.session", defaultValue: false)
    static var sessionStarted: Bool
    
    @UserDefaultsWrapper(key: "com.user.details", defaultValue: [:])
    static var userDetails: [String: String]
}

UserDefaultsConfig.sessionStarted = true
print(UserDefaultsConfig.sessionStarted)   //true

UserDefaultsConfig.userDetails = ["userName" : "Yamamoto", "country" : "Japan"]
print(UserDefaultsConfig.userDetails["userName"].self!) // "Yamamoto"
