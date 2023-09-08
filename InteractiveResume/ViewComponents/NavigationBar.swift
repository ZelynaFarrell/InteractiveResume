//
//  NavigationBar.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/25/23.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var title = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .foregroundColor(appEnvironment.activeMode == .developer ? .blue : .purple).opacity(0.1)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
                .frame(maxHeight: .infinity, alignment: .top)
                .blur(radius: appEnvironment.contentHasScrolled ? 10 : 0)
                .opacity(appEnvironment.contentHasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: appEnvironment.contentHasScrolled ? 22 : 34, weight: .bold)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .opacity(appEnvironment.contentHasScrolled ? 0.7 : 1)
            
            HStack(spacing: 13) {
                
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 36, height: 36)
                    .padding(2)
                    .foregroundColor(.gray)
//                    .background(.ultraThinMaterial)
                    .background(.buttonFill)
                    .backgroundStyle(cornerRadius: 18, opacity: 0.4)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            appEnvironment.isSideOpen = true
                        }
                    }
                
                
                Image(systemName: "doc.on.doc")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 36, height: 36)
                    .padding(2)
                    .foregroundColor(.gray)
//                    .background(.ultraThinMaterial)
                    .background(.buttonFill)
                    .backgroundStyle(cornerRadius: 18, opacity: 0.4)
                    .onTapGesture {
                        withAnimation {
                            appEnvironment.showModal = true
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .offset(y: appEnvironment.showNav ? 0 : -120)
        .offset(y: appEnvironment.contentHasScrolled ? -16 : 0)
    }
}

#Preview {
    NavigationBar()
        .environmentObject(AppEnvironment())
}


struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}
