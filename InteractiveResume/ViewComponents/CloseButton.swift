//
//  CloseButton.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/29/23.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 13, weight: .bold))
            .foregroundColor(.secondary)
            .padding(6)
            .background(.ultraThinMaterial, in: Circle())
            .backgroundStyle(cornerRadius: 18)
    }
}

#Preview {
    CloseButton()
}
