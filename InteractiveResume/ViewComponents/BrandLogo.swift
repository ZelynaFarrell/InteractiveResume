//
//  BrandLogo.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/28/23.
//

import SwiftUI

struct BrandLogo: View {
    var image = educationHistory[0].logo
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(6)
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 18, opacity: 0.4)
    }
}

#Preview {
    BrandLogo()
}

