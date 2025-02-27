//
//  PairsView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 24.02.2025.
//

import SwiftUI

import SwiftData

struct PairsView: View {
    @Environment(\.modelContext) private var modelContext
    var buttonClicked: (() -> Void)?
    var percentage: String = "74%"
    @StateObject private var viewModel: PairsViewModel
    
    init(buttonClicked: (() -> Void)? = nil, pairsInfo: PairsInfo, percentage: String = "74%") {
        self.buttonClicked = buttonClicked
        self.percentage = percentage
        _viewModel = StateObject(wrappedValue: PairsViewModel(pairsInfo: pairsInfo))
    }
    
    var body: some View {
        //        Button(action: {
        //            buttonClicked?()
        //        }, label: {
        //            cardsView
        //                
        //        })
        cardsView
    }
    
    private var cardsView: some View {
        ZStack {
            Image("cardBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(percentage)
                        .font(customFont: .spaceGroteskMedium, size: 12)
                        .foregroundStyle(Color.backgroundColor)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.buttonColor)
                        .cornerRadius(600)
                    
                    Image(viewModel.pairsInfo.typeOfRelation)
                        .padding(.leading, 3)
                        .aspectRatio(contentMode: .fill)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                HStack(spacing: 0) {
                    Text(viewModel.pairsInfo.firstName + " & " + viewModel.pairsInfo.secondName)
                        .font(customFont: .spaceGroteskMedium, size: 23)
                        .foregroundStyle(Color.whiteColor)
                    
                    Spacer()
                    
                    Image("cardButton")
                        .frame(width: 48, height: 48)
                }
                .padding(.horizontal, 24)
                .padding(.top, 21)
                
                HStack(spacing: 6) {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text(viewModel.signOfPerson(personsNum: 1))
                            .font(customFont: .spaceGroteskRegular, size: 12)
                            .foregroundStyle(Color.whiteColor)
                            .padding(.leading, 18)
                        
                        Image(viewModel.signOfPerson(personsNum: 1))
                            .frame(width: 16, height: 16)
                            .padding(.leading, 2)
                            .padding(.trailing, 18)
                    }
                    .padding(.vertical, 6)
                    .background(Color.astroSignBackgroundColor
                        .cornerRadius(600)
                    )
                    
                    HStack(spacing: 0) {
                        Text(viewModel.signOfPerson(personsNum: 2))
                            .font(customFont: .spaceGroteskRegular, size: 12)
                            .foregroundStyle(Color.whiteColor)
                            .padding(.leading, 18)
                        
                        Image(viewModel.signOfPerson(personsNum: 2))
                            .frame(width: 16, height: 16)
                            .padding(.leading, 2)
                            .padding(.trailing, 18)
                    }
                    .padding(.vertical, 6)
                    .background(Color.astroSignBackgroundColor
                        .cornerRadius(600)
                    )
                }
                .padding(.horizontal, 12)
                .padding(.top, 16)
                .padding(.bottom, 11)
            }
        }
        
    }
}
