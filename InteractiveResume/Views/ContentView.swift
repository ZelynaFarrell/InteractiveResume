//
//  ContentView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        ZStack {
            Color(.backgroundBlue)
                .ignoresSafeArea()
            
            Group {
                switch appEnvironment.selectedTab {
                case .experience:
                    ExperienceView()
                case .projects:
                    ProjectsView()
                case .skills:
                   SkillsView()
                case .education:
                   EducationView()
                case .aboutMe:
                    AboutMeView()
                case .hobbies:
                    Text("hobbies")
                case .favorites:
                    Text("favorites")
                case .goals:
                    Text("goals")
                }
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 50)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 90)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(appEnvironment.isSideOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
            .offset(x: appEnvironment.isSideOpen ? 265 : 0)
            .ignoresSafeArea()
            .blur(radius: appEnvironment.showWelcomeMessage ? 2 : 0)
            .blur(radius: appEnvironment.isSideOpen ? 2 : 0)
            .overlay(
                MessageView()
                    .offset(y: appEnvironment.isSideOpen ? -800 : 0)
            )
           

            TabBar()
                .blur(radius: appEnvironment.showWelcomeMessage ? 2 : 0)
                .offset(y: appEnvironment.isSideOpen ? 100 : 0)
                .offset(y: appEnvironment.showModal ? 100 : 0)
             
            

            SideMenu()
                    .offset(x: appEnvironment.isSideOpen ? 0 : -300)
            
            if appEnvironment.showModal {
                ModalView()
            }
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppEnvironment())
}
