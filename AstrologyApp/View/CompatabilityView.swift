//
//  CompatabilityView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI
import SwiftData

struct CompatabilityView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = CompatabilityViewModel()

    
    @StateObject var personsInfoViewModel = PersonsInfoViewModel()

    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.pairs.count == 0 {
                
                emptyCompatabilityView
            } else {
                fullCompatabilityView
            }
            
            NavigationLink(
                destination: CompareTypeView(viewModel: personsInfoViewModel),
                isActive: $viewModel.isNextView
            ) {
                EmptyView()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
        .background(Color.backgroundColor)
    }
    
    
    private var emptyCompatabilityView: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                Button(action: viewModel.addPair) {
                    Image("addButton")
                }
                .frame(width: 57, height: 57)
                .padding(.trailing, 30)
                .padding(.top, 34)
            }
            
            Image("emptyCompatibility")
                .padding(.horizontal, 30)
                .padding(.top, 26)
                .aspectRatio(contentMode: .fit)
            
            Text("Check Your Moon Compatibility")
                .font(customFont: .spaceGroteskMedium, size: 18)
                .foregroundColor(Color.whiteColor)
                .padding(.horizontal)
                .padding(.top, 22)
                .kerning(0.7)
            
            Text("Unlock all the secrets of your compatibility\nbased on the Moon’s position at the\nmoment of birth.")
                .font(customFont: .spaceGroteskMedium, size: 14)
                .foregroundColor(Color.grayTextColor)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .lineLimit(nil)
                .padding(.top, 22)
                .kerning(0.7)
            
            Text("Find out how the Moon with its Phases\ninfluences your relationships and learn how\nto navigate the cosmic currents for a\nharmonious connection with your partner")
                .font(customFont: .spaceGroteskMedium, size: 14)
                .foregroundColor(Color.grayTextColor)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .lineLimit(nil)
                .padding(.top, 18)
                .kerning(0.7)
            
            ButtonView(title: "Start Compatibility") {
                viewModel.startCompatibility()
            }
            .padding(.horizontal, 86)
            .padding(.top, 36)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
    
    private var fullCompatabilityView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Compatability")
                    .font(customFont: .spaceGroteskMedium, size: 18)
                    .foregroundColor(Color.whiteColor)
                
                Spacer()
                
                Button(action: viewModel.addPair) {
                    Image("addFullButton")
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 21)
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(viewModel.pairs, id: \.id) { pair in
                        PairsView(pairsInfo: pair) 
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.top, 30)
            .padding(.bottom, 50)
            .padding(.horizontal, 30)

        }
    }
}
