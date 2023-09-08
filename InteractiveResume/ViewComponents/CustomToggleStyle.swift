//
//  CustomToggleStyle.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/26/23.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            Button {
                configuration.isOn.toggle()
            } label: {
                ZStack {
                    background(isOn: configuration.isOn)
                    
                    LinearGradient(colors: [Color(.borderDark), Color(.borderLight)], startPoint: .top, endPoint: .bottom)
                        .mask {
                            Capsule()
                                .stroke(lineWidth: 6)
                        }
                        .shadow(color: .black.opacity(0.8), radius: 6, x: 0, y: 7)
                    
                    HStack {
                        if !configuration.isOn {
                            Spacer(minLength: 0)
                        }
                        thumb()
                            .frame(width: geo.size.height, height: geo.size.height, alignment: .center)
                            .padding(.vertical, 13)
                        if configuration.isOn {
                            Spacer(minLength: 0)
                        }
                    }
                    .padding(.horizontal, 13)
                }
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
    }
    
    @ViewBuilder private func thumb() -> some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .opacity(0.08)
                .scaleEffect(2.8)
                .blendMode(.softLight)
            
            Circle()
                .fill(Color.white)
                .opacity(0.06)
                .scaleEffect(2.2)
                .blendMode(.softLight)
                .blur(radius: 25)
            
            Circle()
                .fill(Color.white)
                .opacity(0.04)
                .scaleEffect(1.6)
                .blendMode(.softLight)
                .blur(radius: 5)
            
            Image(appEnvironment.isInDevMode ? .dev : .personal)
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFill()
                .overlay {
                    ZStack {
                        LinearGradient(colors: [Color(.thumbBorderDark), Color(.thumbBorderLight)], startPoint: .bottom, endPoint: .top)
                            .mask {
                                Circle()
                                    .stroke(lineWidth: 3)
                        }
                    }
                }
                .shadow(color: .black.opacity(0.6), radius: 20, x: 0, y: 10)
        }
    }
    
    @ViewBuilder private func background(isOn: Bool) -> some View {
        ZStack {
            Color(.toggleFill)

        }
    }
}


#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        
        Toggle("", isOn: .constant(true))
            .frame(width: 300, height: 100, alignment: .center)
            .toggleStyle(CustomToggleStyle())
            .environmentObject(AppEnvironment())
    }
}
