//
//  TabBar.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/25/23.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @State private var color: Color = .teal
    @State private var selectedX: CGFloat = 0
    @State private var x: [CGFloat] = [0, 0, 0, 0]
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 0
            
            HStack {
                content
            }
            .padding(.bottom, hasHomeIndicator ? 16 : 0)
            .frame(maxWidth: .infinity, maxHeight: hasHomeIndicator ? 88 : 49)
            .background(.ultraThinMaterial)
            .background(
                Circle()
                    .fill(color)
                    .offset(x: selectedX, y: -10)
                    .frame(width: 88)
                    .frame(maxWidth: .infinity, alignment: .leading)
            )
            .overlay(
                Rectangle()
                    .frame(width: 28, height: 5)
                    .cornerRadius(3)
                    .frame(width: 88)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: selectedX)
                    .blendMode(.overlay)
            )
            .backgroundStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .offset(y: appEnvironment.showTab ? 0 : 200)
        }
    }
    
    var content: some View {
        ForEach(appEnvironment.isInDevMode ? Array(DeveloperTab.enumerated()) : Array(PersonalTab.enumerated()), id: \.offset) { index, tab in
            
            if index == 0 { Spacer() }
            
            Button {
                appEnvironment.selectedTab = tab.selection
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedX = x[index]
                    color = tab.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: tab.icon)
                        .symbolVariant(.fill)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 44, height: 29)
                    
                    Text(tab.name)
                        .font(.caption2)
                        .frame(width: 88)
                        .lineLimit(1)
                }
                .overlay(
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .global).minX
                        Color.clear
                            .preference(key: TabPreferenceKey.self, value: offset)
                            .onPreferenceChange(TabPreferenceKey.self) { value in
                                x[index] = value
                                if appEnvironment.selectedTab == tab.selection {
                                    selectedX = x[index]
                                }
                            }
                    }
                )
            }
            .frame(width: 44)
            .foregroundColor(appEnvironment.selectedTab == tab.selection ? .primary : .secondary)
            .blendMode(appEnvironment.selectedTab == tab.selection ? .overlay : .normal)
            
            Spacer()
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(AppEnvironment())
    
}


struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct OutlineOverlay: ViewModifier {
    @EnvironmentObject var appEnvironment: AppEnvironment
//    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(appEnvironment.isInDevMode ? 0.6 : 0.3),
                            .black.opacity(appEnvironment.isInDevMode ? 0.3 : 0.1)
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

struct BackgroundColor: ViewModifier {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var opacity: Double = 0.6
    var cornerRadius: CGFloat = 20
//    @Environment(\.colorScheme) var colorScheme
    
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Color("Background")
                    .opacity(appEnvironment.isInDevMode ? opacity : 0)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .blendMode(.overlay)
                    .allowsHitTesting(false)
            )
    }
}

extension View {
    func backgroundColor(opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundColor(opacity: opacity))
    }
}


struct BackgroundStyle: ViewModifier {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var cornerRadius: CGFloat = 20
    var opacity: Double = 0.6
    
    func body(content: Content) -> some View {
        content
            .backgroundColor(opacity: opacity)
            .cornerRadius(cornerRadius)
            .shadow(color: Color(.shadow).opacity(appEnvironment.isInDevMode ? 0.3 : 0), radius: 20, x: 0, y: 10)
            .modifier(OutlineOverlay(cornerRadius: cornerRadius))
    }
}

extension View {
    func backgroundStyle(cornerRadius: CGFloat = 20, opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundStyle(cornerRadius: cornerRadius, opacity: opacity))
    }
}










