//
//  JobDetailView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/28/23.
//

import SwiftUI

struct JobDetailView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    @Binding var experience: Experience
    var namespace: Namespace.ID
    
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
                Image(experience.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .accessibility(hidden: true)
            )
            .background(
                Image(experience.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(experience.index)", in: namespace)
                    .frame(width: 100)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: 12)
            )
            .mask(
                RoundedRectangle(cornerRadius: 20)
                    .matchedGeometryEffect(id: "mask\(experience.index)", in: namespace)
            )
            .overlay(
                VStack(alignment: .center, spacing: 16) {
                    Text(experience.title)
                        .matchedGeometryEffect(id: "title\(experience.index)", in: namespace)
                        .font(.title2).bold()
//                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.primary)
                        .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    
                    Divider()
                        .foregroundColor(.secondary)
                        .opacity(appEnvironment.contentAppear[0] ? 1 : 0)
                    
                    VStack(spacing: 3) {
                        Text(experience.company)
                            .foregroundColor(.primary.opacity(0.7))
                            .matchedGeometryEffect(id: "company\(experience.index)", in: namespace)
                            .font(.headline)
//                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(spacing: 5) {
                            Text(experience.location)
                            Text("|")
                            Text(experience.date)
                        }
                        .foregroundColor(.primary.opacity(0.7))
                        .font(.footnote).bold()
//                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(experience.team)
                            .font(.footnote).bold()
                            .foregroundColor(.primary.opacity(0.7))
                            .matchedGeometryEffect(id: "team\(experience.index)", in: namespace)
//                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .opacity(appEnvironment.contentAppear[1] ? 1 : 0)
                }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(20)
                    .padding(.vertical, 10)
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
                    .offset(y: 100)
                    .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    var jobDetails: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text(experience.description1Header)
                .font(.title3).bold()
                .opacity(appEnvironment.contentAppear[2] ? 1 : 0)
            Text(experience.description1)
                .opacity(appEnvironment.contentAppear[3] ? 1 : 0)
            Divider()
                .padding(.bottom)
              
            
            Text(experience.description2Header)
                .font(.title3).bold()
            Text(experience.description2)
                .opacity(appEnvironment.contentAppear[4] ? 1 : 0)
            Divider()
                .padding(.bottom)
                .opacity(appEnvironment.contentAppear[5] ? 1 : 0)
            
            
            Text(experience.description3Header)
                .font(.title3).bold()
            Text(experience.description3)
                .opacity(appEnvironment.contentAppear[6] ? 1 : 0)
        }
        .font(.body.weight(.medium))
        .foregroundStyle(.primary).opacity(0.8)
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
        .padding(.vertical, 80)
    }
    
    func close() {
        withAnimation(.closeAnimation.delay(0.2)) {
            appEnvironment.contentAppear = Array(repeating: false, count: 7)
            appEnvironment.showJobDetail = false
            appEnvironment.selectedDetail = 0
        }
    }
    
    
}

//
//#Preview {
//    JobDetailView(experience: .constant(sampleExperience[0]))
//        .environmentObject(AppEnvironment())
//}
