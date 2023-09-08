//
//  CommunityDetailView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/30/23.
//

import SwiftUI

struct CommunityDetailView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    @Binding var community: Community
    
    var body: some View {
        ZStack {
            ScrollView {
                top
                jobDetails
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appEnvironment.contentAppear[0] ? 0 : 30))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .background(.ultraThinMaterial)
            .ignoresSafeArea()
        }
        .zIndex(1)
        .onAppear { appEnvironment.animateView() }
        .onDisappear { close() }
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
                Image(community.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: 10, y: -50)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .opacity(0.3)
            )
            .background(
                Image(community.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
                    .padding(.bottom, 220)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text(community.title)
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    
                    Divider()
                        .foregroundColor(.secondary)
                        .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    
                    VStack(spacing: 3) {
                        Text(community.company)
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                     
                            Text(community.location)
                            .foregroundColor(.primary.opacity(0.7))
                            .font(.footnote).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(community.team)
                            .font(.footnote).bold()
                            .foregroundColor(.primary.opacity(0.7))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .opacity(appEnvironment.contentAppear[1] ? 1 : 0)
                }
                    .padding(20)
                    .padding(.vertical, 30)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(maxHeight: .infinity, alignment: .bottom)
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
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    var jobDetails: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text(community.description1Header)
                .font(.title3).bold()
                .opacity(appEnvironment.contentAppear[2] ? 1 : 0)
            Text(community.description1)
                .opacity(appEnvironment.contentAppear[3] ? 1 : 0)
            Divider()
                .padding(.bottom)
              
            
            Text(community.description2Header)
                .font(.title3).bold()
            Text(community.description2)
                .opacity(appEnvironment.contentAppear[4] ? 1 : 0)
            Divider()
                .padding(.bottom)
                .opacity(appEnvironment.contentAppear[5] ? 1 : 0)
            
            
            Text(community.description3Header)
                .font(.title3).bold()
            Text(community.description3)
                .opacity(appEnvironment.contentAppear[6] ? 1 : 0)
        }
        .font(.body.weight(.medium))
        .foregroundStyle(.primary).opacity(0.8)
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
    }
    
    func close() {
        withAnimation(.closeAnimation.delay(0.2)) {
            appEnvironment.contentAppear = Array(repeating: false, count: 7)
            appEnvironment.showCommunityDetail = false
            appEnvironment.selectedDetail = 0
        }
    }
}


#Preview {
    CommunityDetailView(community: .constant(CommunityHistory[0]))
        .environmentObject(AppEnvironment())
}
