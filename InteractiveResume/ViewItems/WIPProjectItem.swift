//
//  WIPProjectItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/30/23.
//

import SwiftUI

struct WIPProjectItem: View {
    var wipProject: WIPProject
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.1))
                .frame(height: 100)
                .overlay(Image(wipProject.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.top, 5)
                )
           
            Divider()
                .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(wipProject.title)
                    .fontWeight(.semibold)
                
                Text(wipProject.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(wipProject.technologies[0])
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(height: 100)
        }
        .padding()
        .frame(width: 180, height: 260)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
    }
}

#Preview {
    WIPProjectItem(wipProject: sampleWIPProjects[2])
}
