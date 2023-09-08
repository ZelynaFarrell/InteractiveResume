//
//  TabData.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/24/23.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

enum Tab: String {
    case experience
    case projects
    case skills
    case education
    case aboutMe
    case hobbies
    case favorites
    case goals
}

var DeveloperTab = [
    TabItem(name: "Experience", icon: "briefcase.fill", color: .teal, selection: .experience),
    TabItem(name: "Projects", icon: "square.grid.2x2.fill", color: .blue, selection: .projects),
    TabItem(name: "Skills", icon: "star.fill", color: .red, selection: .skills),
    TabItem(name: "Education", icon: "book.fill", color: .purple, selection: .education)
]

var PersonalTab = [
    TabItem(name: "About Me", icon: "person.fill", color: .teal, selection: .aboutMe),
    TabItem(name: "Hobbies", icon: "leaf.fill", color: .blue, selection: .hobbies),
    TabItem(name: "Favorites", icon: "heart.fill", color: .red, selection: .favorites),
    TabItem(name: "Goals", icon: "flag.fill", color: .purple, selection: .goals)
]
