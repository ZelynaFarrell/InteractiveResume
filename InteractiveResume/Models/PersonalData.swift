//
//  PersonalData.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/24/23.
//

import Foundation

struct AboutMe {
    var bio: String
}

struct Hobby {
    var title: String
}

struct Favorite {
    var title: String
}

struct Goal {
    var title: String
}

let aboutMeData = AboutMe(bio: "Passionate iOS developer with a love for creative problem-solving...")

let currentHobbies: [Hobby] = [
    Hobby(title: "Snowboarding"),
    Hobby(title: "Surfing"),
    Hobby(title: "Hiking"),
    Hobby(title: "Camping"),
    Hobby(title: "Traveling"),
]

let currentFavorites: [Favorite] = [
    Favorite(title: "Book: The Alchemist"),
    Favorite(title: "Movie: Point Break"),
]

let currentGoals: [Goal] = [
    Goal(title: "Contribute to more open-source projects"),
    // Add more goals
]
