//
//  DataHandler.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 15/02/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import Foundation
class DataHandler {
    static let sharedInstance = DataHandler()
    var loggedInUser : User?
    
    static func getUser() -> User?  {
        if let decoded = UserDefaults.standard.object(forKey: "wfwuser") as? Data,
            let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? User{
            return user
        }
        return nil
    }
    
    static func saveUser(user : AnyObject) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(encodedData, forKey: "wfwuser")
    }

    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: "wfwuser")
    }
}
