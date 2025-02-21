//
//  CompareTypeView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI

struct CompareTypeView: View {
    @ObservedObject var viewModel: PersonsInfoViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedOption: String = "Love"
    
    
    @State private var pairsInfo = PairsInfo(
            typeOfRelation: "",
            firstName: "",
            firstDateOfBirth: Date(),
            firstTimeOfBirth: Date(),
            firstCityOfBirth: "",
            secondName: "",
            secondDateOfBirth: Date(),
            secondTimeOfBirth: Date(),
            secondCityOfBirth: ""
        )
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image("backButton")
                }
                
                Text("Cancel")
                    .font(customFont: .spaceGroteskMedium, size: 18)
                    .foregroundColor(Color.whiteColor)
                    .padding(.leading, 9)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            
            VStack(spacing: 0) {
                Image("star")
                    .padding(.horizontal)
                    .padding(.top, 33)
                
                Text("What do you want to\ncompare?")
                    .font(customFont: .spaceGroteskMedium, size: 23)
                    .foregroundColor(Color.whiteColor)
                    .multilineTextAlignment(.center)
                    .kerning(0.7)
                    .padding(.top, 8)
                
                Text("Enter your name to get started!\nWe are going to make everything personalized!")
                    .font(customFont: .spaceGroteskMedium, size: 14)
                    .foregroundColor(Color.grayTextColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                    .kerning(0.7)
                    .lineSpacing(3)
            }
            .padding(.horizontal, 16)
            
            VStack(spacing: 12) {
                ForEach(viewModel.options, id: \.self) { option in
                    HStack(spacing: 0) {
                        Image(viewModel.selectedOption == option ? "fillOption" : "emptyOption")
                            .padding(.leading, 16)
                            .padding(.top, 16)
                            .padding(.bottom, 16)
                        
                        Text(option)
                            .font(customFont: .spaceGroteskMedium, size: 16)
                            .foregroundColor(Color.whiteColor)
                            .padding(.leading, 10)
                            .padding(.top, 16)
                            .padding(.bottom, 16)
                        
                        Spacer()
                    }
                    .background(Color.rowBackgroundColor)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 16,
                            bottomLeadingRadius: 16,
                            bottomTrailingRadius: 16,
                            topTrailingRadius: 16
                        )
                    )
                    .onTapGesture {
                        viewModel.selectOption(option)
                    }
                }
            }
            .padding(.top, 47)
            .padding(.horizontal, 16)
            
            Spacer()
            
            ButtonView(title: "Start Compatibility") {
                viewModel.addPair()
            }
            .padding(.bottom, 168)
            .padding(.horizontal, 86)
            
            
            
            NavigationLink(
                destination: PersonsInfoView(viewModel: viewModel),
                isActive: $viewModel.isNextView
            ) {
                EmptyView()
            }
        }
        .background(Color.backgroundColor)
        .navigationBarHidden(true)
    }
}
