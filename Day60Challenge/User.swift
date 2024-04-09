//
//  User.swift
//  Day60Challenge
//
//  Created by Samuel Hernandez Vicera on 4/9/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friends]
    var isCurrentlyActive: String {
        if isActive == true {return "🟢"}
        else { return "🔴"}
    }
}

struct Friends: Codable, Identifiable, Hashable {
    var id: String
    var name: String
}
