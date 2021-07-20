# UserDefaultWrapper-Swift  
https://betterprogramming.pub/property-wrappers-in-swift-b8011c47545d
## Wrapper Class
```swift
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
```

## Wapper Config
```swift
struct UserDefaultsConfig {
    @UserDefaultsWrapper(key: "com.user.session", defaultValue: false)
    static var sessionStarted: Bool
    
    @UserDefaultsWrapper(key: "com.user.details", defaultValue: [:])
    static var userDetails: [String: String]
}
```

## Result
```swift
UserDefaultsConfig.sessionStarted = true
print(UserDefaultsConfig.sessionStarted)   //true

UserDefaultsConfig.userDetails = ["userName" : "Yamamoto", "country" : "Japan"]
print(UserDefaultsConfig.userDetails["userName"].self!) // "Yamamoto"
```
