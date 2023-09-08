//
//  EducationItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 9/4/23.
//

import SwiftUI

struct EducationItem: View {
    var education: Education
    
    var body: some View {
        VStack {
            BrandLogo(image: education.logo)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(education.course)
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text(education.institution)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                  
                Text(education.date)
                    .font(.footnote).bold()
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 12)
            .padding(.leading, 15)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(30)
                    .padding(-8)
                    .blur(radius: 25)
            )
        }
        .background(
            Image(education.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 290)
                .opacity(0.7)
        )
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
        .mask(RoundedRectangle(cornerRadius: 30))
        .frame(height: 270)
    }
}

#Preview {
    EducationItem(education: educationHistory[0])
}
