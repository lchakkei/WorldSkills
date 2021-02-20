//
//  Utilities.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import Foundation

struct Utilities {
    // Auth
    static let registerURL = URL(string: "https://reqres.in/api/register")
    static let loginURL = URL(string: "https://reqres.in/api/login")
    static let updatePasswordURL = URL(string: "https://reqres.in/api/password")
    
    // CRUD
    static let listPets = URL(string: "https://reqres.in/api/pets")
    static let createPets = URL(string: "https://reqres.in/api/pets/")
    static let deletePets = URL(string: "https://reqres.in/api/pets/2")
}
