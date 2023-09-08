//
//  CommunityItem.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/30/23.
//

import SwiftUI

struct CommunityItem: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var community: Community
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            
            Text(community.title)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(community.company.uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
            
            Text(community.team.uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .frame(height: 230)
        .background(.backgroundBlue)
        .backgroundColor(opacity: 0.5)
    }
}


#Preview {
    CommunityItem(community: CommunityHistory[0])
        .environmentObject(AppEnvironment())
}
