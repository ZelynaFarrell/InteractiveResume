//
//  VolunteerItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/31/23.
//

import SwiftUI

struct VolunteerItem: View {
    var volunteer: Volunteer
    
    var body: some View {
        VStack {
            Image(volunteer.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(height: 85)
            
                Text(volunteer.title)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
                    .padding(.bottom, 3)
                
                Text(volunteer.company)
                    .font(.footnote).bold()
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                
                Text(volunteer.mission)
                    .font(.footnote).bold()
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
            Spacer()
        }
        .padding(8)
        .frame(width: 250, height: 345)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
    }
}

#Preview {
    VolunteerItem(volunteer: VolunteerHistory[0])
}
