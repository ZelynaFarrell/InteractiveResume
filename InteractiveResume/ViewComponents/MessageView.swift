//
//  MessageView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/30/23.
//

import SwiftUI

struct MessageView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        messageContent
            .opacity(appEnvironment.showWelcomeMessage ? 1 : 0)
            .scaleEffect(appEnvironment.showWelcomeMessage ? 1 : 0)
            .rotationEffect(.degrees(appEnvironment.showWelcomeMessage ? 0 : 30))
            .offset(x: appEnvironment.showWelcomeMessage ? 0 : 500)
            .blur(radius: appEnvironment.showWelcomeMessage ? 0 : 20)
            .padding(10)
            .dynamicTypeSize(.xSmall ... .xxxLarge)
    }
    
    var messageContent: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Welcome")
                .font(.largeTitle.width(.expanded)).bold()
            
            Text("Go to the side menu and toggle between developer mode and personal mode to see different content and learn more about my journey.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .fontWeight(.medium)
            
            Divider()
            
            Button {
                withAnimation(.easeInOut) {
                    appEnvironment.showWelcomeMessage = false
                }
               
            } label: {
                Text("Okay")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.2).gradient)
                    .cornerRadius(10)
                    .background(
                        stroke
                    )
            }
            .accentColor(.primary)
            .shadow(radius: 10)
        }
        .padding(30)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .overlay(
            stroke
        )
        .shadow(color: .black.opacity(0.3), radius: 20, y: 20)
        .frame(maxWidth: 500)
    }
    
    var stroke: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke()
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .clear, .white.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}


#Preview {
    MessageView()
        .environmentObject(AppEnvironment())
}
