//
//  ExperienceView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/28/23.
//

import SwiftUI

struct ExperienceView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Namespace var namespace
  
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            if appEnvironment.showJobDetail {
                detail
            }
            
            ScrollView {
                scrollDetection
                
                Spacer()
                    .frame(height: 150)
                
                
                community
                    .frame(height: 190)
                
                
                Divider()
                    .padding(.horizontal)
                
                Text("Career".uppercased())
                    .sectionTitleModifier()
                
                
                if appEnvironment.showJobDetail {
                    VStack(spacing: 110) {
                        ForEach(ExperienceHistory, id: \.id) { experience in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow").opacity(0.2), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                        }
                    }
                } else {
                    VStack(spacing: 110) {
                        experience
                            .padding(.horizontal, 30)
                    }
                }
                
                Divider()
                    .padding(.horizontal)
                    .padding(.top, 90)
                
                
                Text("Volunteer".uppercased())
                    .sectionTitleModifier()
                    .padding(.top, 5)
                
                volunteer
                    .padding(.horizontal)
                
            }
            .coordinateSpace(name: "scroll")
        }
        .animation(.smooth(duration: 0.4), value: appEnvironment.selectedDetail)
        .onChange(of: appEnvironment.showJobDetail) { _, _ in
            withAnimation {
                appEnvironment.showTab.toggle()
                appEnvironment.showNav.toggle()
            }
        }
        .onChange(of: appEnvironment.showCommunityDetail) { _, _ in
            withAnimation {
                appEnvironment.showTab.toggle()
                appEnvironment.showNav.toggle()
            }
        }
        .overlay(NavigationBar(title: "Experience"))
    }
    
    var community: some View {
        TabView {
            ForEach(CommunityHistory, id: \.id) { community in
                GeometryReader { proxy in
                    CommunityItem(community: community)
                        .cornerRadius(30)
                        .modifier(OutlineModifier(cornerRadius: 30))
                        .rotation3DEffect(
                            .degrees(proxy.frame(in: .global).minX / -10),
                            axis: (x: 0, y: 1, z: 0), perspective: 1
                        )
                        .shadow(color: Color("Shadow").opacity(0.3),
                                radius: 30, x: 0, y: 30)
                        .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                        .overlay(
                            Image(community.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: 110, y: -75)
                                .frame(height: 150)
                                .offset(x: proxy.frame(in: .global).minX / 2)
                                .opacity(0.8)
                        )
                        .padding(20)
                        .onTapGesture {
                            appEnvironment.showCommunityDetail = true
                            appEnvironment.selectedCommunity = community
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 360)
        .sheet(isPresented: $appEnvironment.showCommunityDetail) {
            CommunityDetailView(community: $appEnvironment.selectedCommunity)
        }
    }
    
    var communityDetail: some View {
        ForEach(CommunityHistory, id: \.id) { community in
            if community.index == appEnvironment.selectedDetail {
                CommunityDetailView(community: .constant(community))
            }
        }
    }
    
    var experience: some View {
        ForEach(ExperienceHistory, id: \.id) { experience in
            ExperienceItem(experience: experience, namespace: namespace)
            //                        ExperienceItem(experience: experience)
                .scrollTransition { content, phase in
                    content
                        .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0), perspective: 0.5)
                        .rotationEffect(.degrees(phase.isIdentity ? 0 : -30))
                        .offset(x: phase.isIdentity ? 0 : -200)
                        .blur(radius: phase.isIdentity ? 0 : 5)
                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                }
                .shadow(color: .shadow.opacity(0.2), radius: 8, x: 0, y: appEnvironment.isSideOpen ? 0 : 20)
        }
    }
    
    var detail: some View {
        ForEach(ExperienceHistory, id: \.id) { experience in
            if experience.index == appEnvironment.selectedDetail {
                JobDetailView(experience: .constant(experience), namespace: namespace)
                //                                JobDetailView(experience: .constant(experience))
            }
        }
    }
    
    var volunteer : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(VolunteerHistory, id: \.company) { item in
                    VolunteerItem(volunteer: item)
                }
            }
        }
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
    ExperienceView()
        .environmentObject(AppEnvironment())
}
