//
//  User.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 15/02/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import Foundation

class User : NSObject,NSCoding {
    var username : String?
    var age : String?
    var gender : String?
    var company : String?
    var vehicleType : String?
    
    init(username : String, age : String, gender: String, company : String,vehicleType : String) {
        
        self.username = username
        self.age = age
        self.gender = gender
        self.company = company
        self.vehicleType = vehicleType
    }
    required convenience init(coder aDecoder: NSCoder) {
        let username = aDecoder.decodeObject(forKey: "username") as? String ?? ""
        let age = aDecoder.decodeObject(forKey: "age") as? String ?? ""
        let gender = aDecoder.decodeObject(forKey: "gender") as? String ?? ""
        let company = aDecoder.decodeObject(forKey: "company") as? String ?? ""
        let vehicleType = aDecoder.decodeObject(forKey: "vehicleType") as? String ?? ""
        self.init(username: username, age: age, gender: gender,company: company,vehicleType: vehicleType )
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(gender, forKey: "gender")
        aCoder.encode(company, forKey: "company")
        aCoder.encode(vehicleType, forKey: "vehicleType")
    }
}
