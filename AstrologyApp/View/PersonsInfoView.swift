//
//  PersonsInfoView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI

struct PersonsInfoView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: PersonsInfoViewModel
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                Button {
                    if viewModel.numOfPage == 1 {
                        viewModel.backButtonPressed()
                    } else {
                        dismiss()
                    }
                    viewModel.backButtonPressed()
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
            
            HStack(spacing: 0) {
                Text(viewModel.numOfPerson)
                    .font(customFont: .spaceGroteskMedium, size: 18)
                    .foregroundColor(Color.whiteColor)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            VStack(spacing: 10) {
                TextField("Your name", text: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstName : $viewModel.pairsInfo.secondName)
                    .font(.custom("SpaceGrotesk-Medium", size: 14))
                    .foregroundColor(Color.whiteColor)
                    .padding(.leading, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .background(Color.rowBackgroundColor)
                    .cornerRadius(7)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                DatePickerView(dateOfBirth: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstDateOfBirth : $viewModel.pairsInfo.secondDateOfBirth)
                
                TimePickerView(timeOfBirth: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstTimeOfBirth : $viewModel.pairsInfo.secondTimeOfBirth)
                
                TextField("Your place of birth", text: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstCityOfBirth : $viewModel.pairsInfo.secondCityOfBirth)
                    .font(.custom("SpaceGrotesk-Medium", size: 14))
                    .foregroundColor(Color.whiteColor)
                    .padding(.leading, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .background(Color.rowBackgroundColor)
                    .cornerRadius(7)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                    
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            Spacer()
            
            ButtonView(title: viewModel.buttonTitle) {
                if viewModel.numOfPage == 1 {
                    viewModel.saveData(modelContext: modelContext)
                    print(viewModel.pairsInfo.secondName)
                }
                viewModel.buttonPressed()
                
            }
            .padding(.bottom, 168)
            .padding(.horizontal, 86)
            
        }
        .onAppear {
            viewModel.isNextView = false
            print(viewModel.pairsInfo.typeOfRelation)
        }
        .background(Color.backgroundColor)
        .navigationBarHidden(true)
    }
}

// TODO: -проверка на заполненные данные
// проверить как именно доставать опред пару
