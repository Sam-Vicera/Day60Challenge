//
//  Day60ChallengeApp.swift
//  Day60Challenge
//
//  Created by Samuel Hernandez Vicera on 4/9/24.
//

import SwiftData
import SwiftUI

@main
struct Day60ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
