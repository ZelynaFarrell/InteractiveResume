//
//  ProjectItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/29/23.
//

import SwiftUI

struct ProjectItem: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var project: Project
    
    var body: some View {
        VStack {
            Image(project.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(height: 50)
                .opacity(0.9)
                .overlay(
                    BrandLogo(image: "git")
                    .offset(x: 50, y: -23)
                    .opacity(0.6)
                )
            VStack(alignment: .leading, spacing: 8) {
                Text(project.title)
                    .font(.footnote.bold())
                    .padding(.top, 5)
                
                Text(project.technologies[0])
                    .font(.footnote.bold())
                    .foregroundStyle(.secondary)
                
                Text(project.subtitle)
                    .font(.footnote.bold())
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
        }
        .padding(16)
        .frame(maxWidth: 170)
        .frame(height: 230)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(colors: [project.color1, project.color2], startPoint: .top, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
        .shadow(color: .shadow.opacity(0.3), radius: 5, x: 0, y: 10)
        .padding(.horizontal, 10)
        .onTapGesture {
            withAnimation(.openAnimation) {
                appEnvironment.showProject = true
                appEnvironment.selectedProjectDetail = project.index
            }
        }
    }
}

#Preview {
    ProjectItem(project: sampleProjects[1])
        .environmentObject(AppEnvironment())
}
