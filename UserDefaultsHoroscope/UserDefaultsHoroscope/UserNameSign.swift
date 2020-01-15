//
//  UserNameSign.swift
//  UserDefaultsHoroscope
//
//  Created by Kelby Mittan on 1/14/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation

enum UnitMeasurement: String {
    case miles = "Miles"
    case kilometers = "Kilometers"
}

enum BikeRun: String {
    case bike = "bike"
    case run = "run"
}

struct UserPreferenceKey {
    static let userName = "User Name"
    static let bikeRunImage = "Bike or Run"
}

class UserNameSign {
    
    private init() {}
    
    static let shared = UserNameSign()
    
    func updateUserName(with unit: String) {
        // storing or persiting the unit measurment value to UserDefaults (device or simimular as permanent storage)
        
        // UserDefaults.standard is a Singleton in iOS that gives us access to
        // saving and retrieving stored data in the device or simulator
        UserDefaults.standard.set(unit, forKey: UserPreferenceKey.userName)
        
        // key is "Unit Measurement"
        // value is either "Miles" or "Kilometers"
        // UserDefaults: ["Unit Measurement" : "Kilometers"]
    }
    
    func updateImage(with image: BikeRun) {
        UserDefaults.standard.set(image.rawValue, forKey: UserPreferenceKey.bikeRunImage)
    }
    
    // retrieve a user defaults value (object)
    func getUserName() -> String? {
        guard let userName = UserDefaults.standard.object(forKey: UserPreferenceKey.userName) as? String else {
            return nil
        }
        return userName
    }
    
    func getImageString() -> BikeRun? {
        guard let bikeOrRun = UserDefaults.standard.object(forKey: UserPreferenceKey.bikeRunImage) as? String else {
            return nil
        }
        return BikeRun(rawValue: bikeOrRun)
    }
}
