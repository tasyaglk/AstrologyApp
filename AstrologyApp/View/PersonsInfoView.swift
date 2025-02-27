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
    @State var tapped: Bool = false
    @FocusState private var isCityFieldFocused: Bool
    @State private var showCitySearch = false
    
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 0) {
            
            headerView
            
            ZStack {
                if !showCitySearch {
                    ScrollView {
                        VStack(spacing: 10) {
                            
                            commonView
                            
                            TextField("Your place of birth", text: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstCityOfBirth : $viewModel.pairsInfo.secondCityOfBirth)
                                .font(.custom("SpaceGrotesk-Medium", size: 14))
                                .foregroundColor(Color.whiteColor)
                                .padding(.leading, 16)
                                .padding(.top, 12)
                                .padding(.bottom, 12)
                                .background(Color.rowBackgroundColor)
                                .cornerRadius(7)
                                .matchedGeometryEffect(id: "placeOfBirth", in: namespace)
                                .onTapGesture {
                                    withAnimation {
                                        showCitySearch = true
                                        isCityFieldFocused = true
                                    }
                                }
                            
                            Spacer()
                            
                            ButtonView(title: viewModel.buttonTitle) {
                                if viewModel.numOfPage == 1 {
                                    viewModel.saveData(modelContext: modelContext)
                                    print(viewModel.pairsInfo.secondCityOfBirth)
                                }
                                viewModel.buttonPressed()
                                
                            }
                            .padding(.top, 223)
                            .padding(.bottom, 168)
                            .padding(.horizontal, 86)
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 30)
                        .ignoresSafeArea(.keyboard)
                    }
                } else {
                    VStack(spacing: 0) {
                        TextField("Your place of birth", text: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstCityOfBirth : $viewModel.pairsInfo.secondCityOfBirth)
                            .font(.custom("SpaceGrotesk-Medium", size: 14))
                            .foregroundColor(Color.whiteColor)
                            .padding(.leading, 16)
                            .padding(.top, 12)
                            .padding(.bottom, 12)
                            .background(Color.rowBackgroundColor)
                            .cornerRadius(7)
                            .onChange(of: viewModel.numOfPage == 0 ? viewModel.pairsInfo.firstCityOfBirth : viewModel.pairsInfo.secondCityOfBirth, { _, newValue in
                                viewModel.performSearch(query: newValue)
                            })
                            .matchedGeometryEffect(id: "placeOfBirth", in: namespace)
                        
                        if !viewModel.searchResults.isEmpty {
                            List(viewModel.searchResults, id: \.self) { location in
                                Text(location.locationText())
                                    .font(.custom("SpaceGrotesk-Medium", size: 14))
                                    .foregroundColor(Color.whiteColor)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.rowBackgroundColor)
                                    .listRowBackground(Color.rowBackgroundColor)
                                    .onTapGesture {
                                        let selectedCity = location.locationText()
                                        viewModel.selectCity(selectedCity)
                                        withAnimation {
                                            showCitySearch = false
                                            isCityFieldFocused = false
                                        }
                                    }
                            }
                            .scrollContentBackground(.hidden)
                            .scrollDismissesKeyboard(.interactively)
                            .background(Color.clear)
                            .animation(.easeInOut, value: viewModel.searchResults)
                            .padding(.horizontal, -20)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                }
            }
            
            NavigationLink(
                destination: CompatabilityView(),
                isActive: $viewModel.isNextView
            ) {
                EmptyView()
            }
        }
        .onAppear {
            viewModel.isNextView = false
            print(viewModel.pairsInfo.typeOfRelation)
        }
        .background(Color.backgroundColor)
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("ok", role: .cancel) {}
        } message: {
            Text("You have to add all information correctly")
        }
        .navigationBarHidden(true)
    }
}


private extension PersonsInfoView {
    var headerView: some View {
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
    }
    
    var commonView: some View {
        VStack(spacing: 10){
            HStack(spacing: 0) {
                Text(viewModel.numOfPerson)
                    .font(customFont: .spaceGroteskMedium, size: 18)
                    .foregroundColor(Color.whiteColor)
                
                Spacer()
            }
            
            TextField("Your name", text: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstName : $viewModel.pairsInfo.secondName)
                .font(.custom("SpaceGrotesk-Medium", size: 14))
                .foregroundColor(Color.whiteColor)
                .padding(.leading, 16)
                .padding(.top, 12)
                .padding(.bottom, 12)
                .background(Color.rowBackgroundColor)
                .cornerRadius(7)
                .ignoresSafeArea(.keyboard)
            
            DatePickerView(dateOfBirth: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstDateOfBirth : $viewModel.pairsInfo.secondDateOfBirth)
            
            TimePickerView(timeOfBirth: viewModel.numOfPage == 0 ? $viewModel.pairsInfo.firstTimeOfBirth : $viewModel.pairsInfo.secondTimeOfBirth)
        }
    }
}
