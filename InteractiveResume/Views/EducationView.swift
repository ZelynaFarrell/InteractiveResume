//
//  EducationView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 9/2/23.
//

import SwiftUI

struct EducationView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 2)
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                Spacer()
                    .frame(height: 90)
                
     
                LazyVGrid(columns: columns, spacing: 40) {
                    educationSection
                }
             
                Text("Continued Education".uppercased())
                    .sectionTitleModifier()
                    .padding(.top, 40)
                
                continuedEducationSection
            }
        }
        .overlay(NavigationBar(title: "Education"))
      
    }
    
    var educationSection: some View {
        ForEach(educationHistory, id: \.course) { education in
            EducationItem(education: education)
                .shadow(color: .shadow.opacity(0.3), radius: 8, x: 0, y: appEnvironment.isSideOpen ? 0 : 20)
                .padding(.horizontal, 30)
        }
    }

    
    var continuedEducationSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(continuedEducation, id: \.course) { course in
                    SmallEducationItem(education: course)
                }
            }
            .padding(.leading, 8)
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
    EducationView()
        .environmentObject(AppEnvironment())
}
