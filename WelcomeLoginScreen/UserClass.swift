//
//  UserClass.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 24.03.2022.
//

import Foundation

class User {
    var name = ""
    var password = ""
    
    init() {}
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}
