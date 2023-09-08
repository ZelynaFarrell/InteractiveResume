//
//  AboutMeView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 9/6/23.
//

import SwiftUI

struct AboutMeView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                Spacer()
                    .frame(height: 150)
            }
        }
        .overlay(NavigationBar(title: "About Me"))
    }
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    appEnvironment.contentHasScrolled = true
                } else {
                    appEnvironment.contentHasScrolled = false
                }
            }
        }
    }
}

#Preview {
    AboutMeView()
        .environmentObject(AppEnvironment())
}
