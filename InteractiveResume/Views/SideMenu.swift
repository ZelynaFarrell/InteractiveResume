//
//  SideMenu.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/24/23.
//

import SwiftUI

struct SideMenu: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(.devMode)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .background(.white.opacity(0.2))
                        .mask(Circle())
                        .opacity(appEnvironment.isInDevMode ? 1 : 0)
                        .offset(x: appEnvironment.isInDevMode ? 0 : -1000)
                    
                    Image(.personalMode)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .background(.white.opacity(0.2))
                        .mask(Circle())
                        .opacity(appEnvironment.isInDevMode ? 0 : 1)
                        .offset(x: appEnvironment.isInDevMode ? -1000 : 0)
                }
                .animation(.bouncy(duration: 1), value: appEnvironment.isInDevMode)
                
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Zelyna Farrell")
                        .font(.title3).bold()
                    
                    Text(appEnvironment.isInDevMode ? "iOS Developer" : "Mother")
                        .font(.subheadline)
                        .opacity(0.7)
                        .animation(.easeInOut(duration: 0.6), value: appEnvironment.isInDevMode)
                }
                
                Spacer()
                
                Button {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        appEnvironment.isSideOpen = false
                    }
                } label: {
                    CloseButton()
                        .padding(.bottom, 60)
                }
                
            }
            .padding()
            
           contactInfo
        
            Spacer()
            
            Toggle("", isOn: $appEnvironment.isInDevMode.animation(.easeInOut))
                .frame(width: 180, height: 60, alignment: .center)
                .padding(.bottom, 40)
                .toggleStyle(CustomToggleStyle())
                .onChange(of: appEnvironment.isInDevMode) { _, _ in
                    if appEnvironment.isInDevMode {
                        appEnvironment.selectedTab = .experience
                    } else {
                        appEnvironment.selectedTab = .aboutMe
                    }
                }
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(.backgroundBlue))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(.backgroundBlue).opacity(0.3), radius: 40, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(appEnvironment.isInDevMode ? .dark : .light)
        .animation(.easeInOut(duration: 0.8), value: appEnvironment.isInDevMode)
    }
    
    var contactInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("CONTACT")
                .font(.headline).bold()
                .padding(.leading, 20)
                .padding(.top, 40)
                .opacity(0.4)
            
            divider
            
            HStack(spacing: 10)  {
                Image(.location)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.leading, 5)
                
                VStack(alignment: .leading) {
                    Text("Location")
                        .foregroundStyle(.secondary).opacity(0.3)
                    
                    Text(appEnvironment.isInDevMode ? "USA" : "Portland, OR")
                        .font(.headline)
                }
                .padding(.leading, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)

            divider
            
            HStack(spacing: 10) {
                Image(appEnvironment.isInDevMode ? .git : .phone)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .padding(.leading, 5)
                
                VStack(alignment: .leading) {
                    Text(appEnvironment.isInDevMode ? "GitHub" : "Cellphone")
                        .foregroundStyle(.secondary).opacity(0.3)
                    
                    Text(appEnvironment.isInDevMode ? "ZelynaFarrell" : "541-647-4131")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)

            divider
            
            HStack(spacing: 10) {
                Image(appEnvironment.isInDevMode ? .linked : .insta)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .padding(.leading, 5)
                
                VStack(alignment: .leading) {
                    Text(appEnvironment.isInDevMode ? "LinkedIn" : "Instagram")
                        .foregroundStyle(.secondary).opacity(0.3)
                    
                    Text("ZelynaFarrell")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)

            divider
            
            HStack(spacing: 10) {
                Image(appEnvironment.isInDevMode ? .email : .facebook)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .padding(.leading, 5)
                
                VStack(alignment: .leading) {
                    Text(appEnvironment.isInDevMode ? "Email" : "Facebook")
                        .foregroundStyle(.secondary).opacity(0.3)
                    
                    Text(verbatim: appEnvironment.isInDevMode ? "zelynafarrell@gmail.com" : "ZelynaFarrell")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
       
            divider
        }
    }
    
    var divider: some View {
        Rectangle()
            .frame(height: 1)
            .opacity(0.1)
            .padding(.horizontal, 16)
            .padding(.bottom, 15)
    }
}

#Preview {
    SideMenu()
        .environmentObject(AppEnvironment())
}
