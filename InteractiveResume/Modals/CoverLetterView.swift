//
//  CoverLetterView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/25/23.
//

import SwiftUI

struct CoverLetterView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("CoverLetter")
                .font(.largeTitle).bold()
                .blendMode(.overlay)
                .slideFadeIn(show: appEnvironment.contentAppear[0], offset: 30)

            partOne
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.7))
            
            Divider()
            
            Text("Want more formal content? **resume**")
                .font(.footnote)
                .foregroundColor(.primary.opacity(0.7))
                .accentColor(.primary.opacity(0.7))
                .onTapGesture {
                    appEnvironment.contentAppear = Array(repeating: false, count: 7)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            appEnvironment.selectedModal = .resume
                        }
                    }
                }
        }
//        .coordinateSpace(name: "stack")
        .padding(15)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .backgroundColor(opacity: 0.4)
        .cornerRadius(30)
        .background(
            VStack {
                Circle().fill(appEnvironment.isInDevMode ? .blue : .purple).frame(width: 88, height: 88)
                    .scaleEffect(appEnvironment.contentAppear[0] ? 1 : 0.1)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        )
        .modifier(OutlineModifier(cornerRadius: 30))
        .onAppear { appEnvironment.animateView() }
        .frame(height: 760)
    }
    var partOne: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Dear Hiring Manager,")
            .slideFadeIn(show: appEnvironment.contentAppear[1], offset: 25)
            
            Text("""
My name is Zelyna, and I am very interested in the open iOS Developer role.

Rather than reformatting my resume into paragraph form, I've opted for a different approach. At this point in the traditional cover letter process, Google tells me I should showcase my achievements as a way to introduce myself. While I could certainly do that by discussing my experience growing and leading successful teams across various US brands, spanning both business and creative realms, I'll assume you've already dissected my resume like it's a final exam.
""").slideFadeIn(show: appEnvironment.contentAppear[2], offset: 25)
            
            Text("""
Here is the second paragraph, it should be filled with why I want to join your company. Then I’m told I should drive my point home in the final paragraph by reiterating what I’ve already said but with slightly different wording. Since I am not the only one to apply for this position, I will spare you the repetitiveness.
""").slideFadeIn(show: appEnvironment.contentAppear[3], offset: 25)
            
            HStack {
                Text("You should want to hire me. Here’s why...")
                    .slideFadeIn(show: appEnvironment.contentAppear[3], offset: 25)
               
                Spacer()
                
                Button {
                    appEnvironment.contentAppear = Array(repeating: false, count: 7)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            appEnvironment.selectedModal = .coverLetterPartTwo
                        }
                    }
                } label: {
                    Image(systemName: "arrow.right.circle")
                        .font(.title3)
                }
                .slideFadeIn(show: appEnvironment.contentAppear[4], offset: 25)
            }
        }
    }
}


#Preview {
    CoverLetterView()
        .environmentObject(AppEnvironment())
}
