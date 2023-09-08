//
//  ProjectsView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/29/23.
//

import SwiftUI

struct ProjectsView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    private var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            if appEnvironment.showProject {
               detail
            }
            
            ScrollView {
                scrollDetection
                
                Spacer()
                    .frame(height: 90)

                
                LazyVGrid(columns: gridItemLayout) {
                    projectsSection
                }
              
                
                Text("Under Construction".uppercased())
                    .sectionTitleModifier()
                
                WIPSection
                
            }
            .coordinateSpace(name: "scroll")
        }
        .onChange(of: appEnvironment.showProject) { _, _ in
            withAnimation {
                appEnvironment.showTab.toggle()
                appEnvironment.showNav.toggle()
            }
        }
        .overlay(NavigationBar(title: "Projects"))
    }
    
    var detail: some View {
        ForEach(sampleProjects) { project in
            if project.index == appEnvironment.selectedProjectDetail {
                ProjectDetailView(project: .constant(project))
            }
        }
    }
    
    var projectsSection: some View {
        ForEach(sampleProjects) { project in
            ProjectItem(project: project)
                .padding(.bottom, 40)
        }
    }
    
    var WIPSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 26) {
                ForEach(sampleWIPProjects, id: \.title) { wip in
                   WIPProjectItem(wipProject: wip)
                }
            }
            .padding(20)
        }
    }
    
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    appEnvironment.contentHasScrolled = true
                } else {
                    appEnvironment.contentHasScrolled = false
                }
            }
        }
    }
}





#Preview {
    ProjectsView()
        .environmentObject(AppEnvironment())
}
