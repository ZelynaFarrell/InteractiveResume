//
//  ProjectDetailView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/29/23.
//

import SwiftUI

struct ProjectDetailView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.openURL) private var openURL
    
    var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    
    @Binding var project: Project
    
    var body: some View {
        ZStack {
            ScrollView {
                top
                
                details
                    .padding(.top, 80)
                
                Text("Features".uppercased())
                    .sectionTitleModifier()
                
                features
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appEnvironment.contentAppear[0] ? 0 : 30))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .background(.ultraThinMaterial)
            .ignoresSafeArea()
            
            Button {
                close()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(30)
            .padding(.top)
            .ignoresSafeArea()
        }
        .zIndex(1)
        .onAppear { appEnvironment.animateView() }
    }
    
    var top: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .background(
                Image(project.detailImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding(.bottom)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
            )
            .mask(RoundedRectangle(cornerRadius: 20))
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(project.title)
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                            .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                        
                        BrandLogo(image: "git")
                            .offset(y: -30)
                            .opacity(0.7)
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    openURL(URL(string: project.url)!)
                                }
                            }
                    }
                    
                    Divider()
                        .foregroundColor(.secondary)
                        .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    

                    LazyVGrid(columns: gridItemLayout, alignment: .leading) {
                            ForEach(project.technologies, id: \.self) { tech in
                                Text(tech)
                            }
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.semibold))

                    }
                    .opacity(appEnvironment.contentAppear[1] ? 1 : 0)
                    
                }
                    .padding(20)
                    .padding(.vertical, 10)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .cornerRadius(30)
                            .blur(radius: 30)
                            .opacity(appEnvironment.contentAppear[0] ? 0 : 1)
                    )
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .backgroundStyle(cornerRadius: 30)
                            .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    )
                    .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                    .frame(height: 400, alignment: .bottom)
                    .offset(y: 140)
                    .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    var details: some View {
        VStack(alignment: .leading) {
            Text(project.subtitle)
                .opacity(appEnvironment.contentAppear[2] ? 1 : 0)
        }
        .font(.headline)
        .foregroundStyle(.primary).opacity(0.8)
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
    }
    
    var features: some View {
        VStack(alignment: .leading, spacing: 25) {
            ForEach(Array(project.features.enumerated()), id: \.offset) { index, feature in
                if index != 0 { Divider() }
                Text(feature)
            }
        }
        .font(.headline)
        .foregroundStyle(.primary).opacity(0.8)
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
    }
    
    func close() {
        withAnimation(.closeAnimation.delay(0.2)) {
            appEnvironment.contentAppear = Array(repeating: false, count: 7)
            appEnvironment.showProject = false
            appEnvironment.selectedProjectDetail = 0
        }
    }
    
    
}


#Preview {
    ProjectDetailView(project: .constant(sampleProjects[0]))
        .environmentObject(AppEnvironment())
}
