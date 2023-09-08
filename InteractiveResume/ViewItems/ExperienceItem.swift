//
//  ExperienceItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/28/23.
//

import SwiftUI

struct ExperienceItem: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var experience: Experience
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .modifier(OutlineModifier(cornerRadius: 20))
        .background(
            Image(experience.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(experience.index)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 20)
                .matchedGeometryEffect(id: "mask\(experience.index)", in: namespace)
        )
        .frame(height: 205)
        .cornerRadius(20)
        .shadow(color: .shadow.opacity(0.4), radius: 8, x: 0, y: appEnvironment.isSideOpen ? 0 : 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            VStack(spacing: 15) {
                Text(experience.title)
                    .matchedGeometryEffect(id: "title\(experience.index)", in: namespace)
                    .font(.title3).bold()
                
                VStack(spacing: 8) {
                    Text(experience.company)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "company\(experience.index)", in: namespace)
                        .font(.subheadline.weight(.semibold))
                    
                    Text(experience.team)
                        .font(.footnote).bold()
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "team\(experience.index)", in: namespace)
                }
            }
                .frame(height: 115)
                .padding(15)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .offset(y: 105)
                .padding(25)
        )
        .onTapGesture {
            withAnimation(.openAnimation) {
                appEnvironment.showJobDetail = true
                appEnvironment.selectedDetail = experience.index
            }
        }
    }
}


//
//#Preview {
//    ExperienceItem(experience: sampleExperience[0])
//        .environmentObject(AppEnvironment())
//}
