//
//  Utilities.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import Foundation

struct Utilities {
    static let API_KEY = "https://wshk1920.herokuapp.com/"
    // Auth
    static let registerURL = URL(string: "\(API_KEY)api/register")
    static let loginURL = URL(string: "\(API_KEY)api/login")
    static let updatePasswordURL = URL(string: "\(API_KEY)api/password")
    
    // CRUD
    static let listURL = URL(string: "\(API_KEY)api/pets")
    static let createURL = URL(string: "\(API_KEY)api/pets/")
    static let deleteURL = "\(API_KEY)api/pets/2"
    static let updateURL = "\(API_KEY)api/pets/"
}
