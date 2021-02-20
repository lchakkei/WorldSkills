//
//  User.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import Foundation

struct Pet: Codable {
    let data: [Data]
}

struct Data: Codable {
    let breed: String
    let id: Int
    let name: String
    let species: String
    let thumbnail: String
}
