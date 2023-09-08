//
//  AppEnvironment.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/25/23.
//

import Foundation
import SwiftUI

enum Mode {
    case developer
    case personal
}

enum Modal: String {
    case resume
    case coverLetter
    case coverLetterPartTwo
    case coverLetterPartThree
}

class AppEnvironment: ObservableObject {
    //message view
    @Published var showWelcomeMessage: Bool = true
    
    // all views
    @Published var contentHasScrolled: Bool = false

    @Published var activeMode: Mode = .developer
    @Published var selectedTab: Tab = .experience
    @Published var isInDevMode: Bool = true
    @Published var showTab: Bool = true
  
    // SideMenu
    @Published var isSideOpen: Bool = false
    
//    // Navigation Bar
    @Published var showNav: Bool = true
    
    // experience view
    @Published var show = false
    @Published var showExperience = false
    @Published var showJobDetail: Bool = false
    @Published var selectedDetail: Int = 0
    @Published var selectedCommunity: Community = CommunityHistory[0]
    @Published var showCommunityDetail: Bool = false
    
    // Project view
    @Published var showProject: Bool = false
    @Published var selectedProjectDetail: Int = 0
    @Published var selectedProject: Project = sampleProjects[0]
    
    // Modal
    @Published var selectedModal: Modal = .resume
    @Published var showModal = false
    @Published var appear = false
    @Published var appearBackground = false
    @Published var contentAppear = [false, false, false, false, false, false, false]
    
    func dismissModal() {
        withAnimation {
            appear = false
            appearBackground = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                showModal = false
                contentAppear = Array(repeating: false, count: 7)
                selectedModal = .resume
            }
        }
    }
    
    func animateView() {
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.2)) {
            contentAppear[0] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.4)) {
            contentAppear[1] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.6)) {
            contentAppear[2] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.8)) {
            contentAppear[3] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.0)) {
            contentAppear[4] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.2)) {
            contentAppear[5] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(1.4)) {
            contentAppear[6] = true
        }
    }
    
    
    

}

