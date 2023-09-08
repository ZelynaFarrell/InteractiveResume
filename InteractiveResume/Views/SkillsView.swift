//
//  SkillsView.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 9/2/23.
//

import Charts
import SwiftUI

struct SkillsView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @State var chartData: [Skill] = technicalSkills
    @State private var isShowingTechnicalSkills = true
    @State var currentActiveItem: Skill?
    @State var plotWidth: CGFloat = 0
    
    @State private var isLineGraph: Bool = false
    @State private var isPressed: Bool = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                Spacer()
                    .frame(height: 80)
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Type")
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                            
                            Picker("", selection: $isShowingTechnicalSkills) {
                                Text("Technical").tag(true)
                                Text("Soft").tag(false)
                                
                            }
                            .pickerStyle(.segmented)
                            .padding(.leading, 80)
                        }
                        
                        Text(currentActiveItem?.title ?? "")
                            .frame(height: 30)
                            .font(.title2).bold()
                        
                        showChart()
                        
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.skillFrame)
                    }
                    .shadow(color: .shadow.opacity(0.3), radius: 8, x: 0, y: appEnvironment.isSideOpen ? 0 : 20)
                    
                    lineGraphButton
                        .padding(.trailing)
                        .padding(.top)
                }
                .padding(8)
                .onChange(of: isShowingTechnicalSkills) { _, _ in
                    chartData = isShowingTechnicalSkills ? technicalSkills : softSkills
                    animateChart(fromChange: true)
                }
                .onChange(of: isLineGraph) { _, _ in
                    chartData = isShowingTechnicalSkills ? technicalSkills : softSkills
                    animateChart(fromChange: true)
                }
            }
        }
        .overlay(NavigationBar(title: "Skills"))
    }
    
    @ViewBuilder
    func showChart() -> some View {
        Chart {
            ForEach(chartData, id: \.id) { skill in
                
                if isLineGraph {
                    LineMark(x: .value("Title", skill.title),
                             y: .value("Proficiency", skill.animate ? skill.proficiencyLevel : 0))
                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom))
                    .interpolationMethod(.catmullRom)
                } else {
                    BarMark(x: .value("Title", skill.title),
                            y: .value("Proficiency", skill.animate ? skill.proficiencyLevel : 0))
                    .foregroundStyle(.linearGradient(colors: [.indigo, .purple], startPoint: .top, endPoint: .bottom))
                }
                
                if isLineGraph {
                    AreaMark(x: .value("Title", skill.title),
                             y: .value("Proficiency", skill.animate ? skill.proficiencyLevel : 0))
                    .foregroundStyle(.linearGradient(colors:  [.green, .blue], startPoint: .top, endPoint: .bottom)).opacity(0.2)
                    .interpolationMethod(.catmullRom)
                }
                
                if let currentActiveItem, currentActiveItem.id == skill.id {
                    RuleMark(x: .value("Title", currentActiveItem.title))
                    
                }
            }
            .cornerRadius(4)
        }
        .chartOverlay { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let location = value.location
                                
                                if let name: String = proxy.value(atX: location.x) {
                                    if let currentItem = chartData.first(where: { item in
                                        item.title == name
                                    }) {
                                        self.currentActiveItem = currentItem
                                        self.plotWidth = proxy.plotSize.width
                                    }
                                }
                            }
                            .onEnded { value in
                                self.currentActiveItem = nil
                            }
                    )
            }
        }
        .frame(height: 340)
        .onAppear {
            animateChart()
        }
    }
    
    var lineGraphButton: some View {
        Button {
            isLineGraph.toggle()
            isPressed.toggle()
        } label: {
            HStack {
                Spacer()
                
                ZStack {
                    Capsule()
                        .frame(width: 75, height: 35)
                        .foregroundStyle(isPressed ? .green.opacity(0.6): .gray)
                        .overlay(
                            Capsule().stroke()
                                .foregroundStyle(.black)
                        )
                    
                    Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white).opacity(0.8)
                        .padding(isPressed ? .leading : .trailing, 37)
                        .animation(.easeInOut(duration: 0.5), value: isPressed)
                }
                .shadow(color: .shadow.opacity(0.3), radius: 4, x: 0, y: appEnvironment.isSideOpen ? 0 : 5)
                
            }
        }
    }
    
    
    func animateChart(fromChange: Bool = false) {
        chartData.indices.forEach { index in
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)) {
                withAnimation(fromChange ? .easeInOut(duration: 0.8) :
                        .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                            chartData[index].animate = true
                        }
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    appEnvironment.contentHasScrolled = true
                } else {
                    appEnvironment.contentHasScrolled = false
                }
            }
        }
    }
    
}




#Preview {
    SkillsView()
        .environmentObject(AppEnvironment())
}


