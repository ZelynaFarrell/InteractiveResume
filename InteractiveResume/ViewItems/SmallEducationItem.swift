//
//  SmallEducationItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 9/5/23.
//

import SwiftUI

struct SmallEducationItem: View {
    var education: Education
    
    var body: some View {
        VStack {
            Image(education.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(height: 80)
            
            Divider()
                .padding(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(education.course)
                    .font(.headline).bold()
                    .lineLimit(3)
                
                Text(education.institution)
                    .font(.footnote).bold()
                    .foregroundColor(.secondary)
                  
                
                Text(education.date)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .padding(8)
        .frame(width: 180, height: 220)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 20)
    }
}

#Preview {
    SmallEducationItem(education: continuedEducation[0])
}
