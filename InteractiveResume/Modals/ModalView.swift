//
//  ModalView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/25/23.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.dismiss) var dismiss
    @State var viewState = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                if value.translation.height > 300 {
                    appEnvironment.dismissModal()
                } else {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        viewState = .zero
                    }
                }
            }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(appEnvironment.appear ? 1 : 0)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                Group {
                    switch appEnvironment.selectedModal {
                    case .resume:
                        ResumeView()
                    case .coverLetter:
                       CoverLetterView()
                    case .coverLetterPartTwo:
                        CoverLetterPartTwo()
                    case .coverLetterPartThree:
                        CoverLetterPartThree()
                    }
                }
                .rotationEffect(.degrees(viewState.width / 40))
                .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0), perspective: 1)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                .padding(.horizontal, 10)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(drag)
                .frame(maxHeight: .infinity, alignment: .center)
                .offset(y: appEnvironment.appear ? 0 : proxy.size.height)
                .background(
                    Image(.blob)
                        .offset(x: 170, y: -90)
                        .opacity(appEnvironment.appearBackground ? 1 : 0)
                        .offset(y: appEnvironment.appearBackground ? -10 : 0)
                        .blur(radius: appEnvironment.appearBackground ? 0 : 40)
                        .hueRotation(.degrees(viewState.width / 5))
                )
                .background(
                    Image(.spline)
                        .blur(radius: 30)
                        .offset(x: 100, y: 100)
                        .hueRotation(.degrees(viewState.width / 2))
                )
                .animation(.easeInOut(duration: 0.4), value: appEnvironment.selectedModal)
            }
            
            Button {
                appEnvironment.dismissModal()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing)
            .offset(y: appEnvironment.appear ? 0 : -100)
        }
        .onAppear {
            withAnimation(.spring()) {
                appEnvironment.appear = true
            }
            withAnimation(.easeOut(duration: 2)) {
                appEnvironment.appearBackground = true
            }
        }
//        .onDisappear {
//            withAnimation(.spring()) {
//                appEnvironment.appear = false
//            }
//            withAnimation(.easeOut(duration: 1)) {
//                appEnvironment.appearBackground = true
////                appEnvironment.contentAppear = Array(repeating: false, count: 7)
////                appEnvironment.selectedModal = .resume
//            }
//        }
    }
}

#Preview {
    ModalView()
        .environmentObject(AppEnvironment())
}
