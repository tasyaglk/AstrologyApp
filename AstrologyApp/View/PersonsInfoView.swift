//
//  PersonsInfoView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI

struct PersonsInfoView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = PersonsInfoViewModel()
    
    @State var name: String = ""
    @State var dateOfBirth: Date = Date()
    @State var timeOfBirth: Date = Date()
    @State var city: String = ""
    
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
                TextField("Your name", text: $name)
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
                
                DatePickerView(dateOfBirth: $dateOfBirth)
                
                TimePickerView(timeOfBirth: $timeOfBirth)
                
                TextField("Your place of birth", text: $city)
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
                viewModel.buttonPressed()
            }
            .padding(.bottom, 168)
            .padding(.horizontal, 86)
            
        }
        .background(Color.backgroundColor)
        .navigationBarHidden(true)
    }
}
