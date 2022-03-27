//
//  User.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 24.03.2022.
//

import Foundation


struct User {
    let name: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            name: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let hobby: String
    let about: String
    let job: String
    let image: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    static func getPerson() -> Person {
        Person(
            firstName: "Vladimir",
            lastName: "Kiselev",
            hobby: "I love music! I love snowboarding, playing games and write code!",
            about: "iOS Developer, Data Engineer",
            job: "Freelancer",
            image: "UserImage"
        )
    }
}
