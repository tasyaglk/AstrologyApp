//
//  PairsView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 24.02.2025.
//

import SwiftUI

struct PairsView: View {
    var buttonClicked: (() -> Void)?
    var pairsInfo: PairsInfo
    var percentage: String = "74%"
    @StateObject private var viewModel = PairsViewModel()

    var body: some View {
        ZStack {
            Image("cardBackground")
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
                    
                    Image(pairsInfo.typeOfRelation)
                        .padding(.leading, 3)
                        .aspectRatio(contentMode: .fill)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                
                HStack(spacing: 0) {
                    Text(pairsInfo.firstName + " & " + pairsInfo.secondName)
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
                        Text(viewModel.signOfPerson(dateOfBirth: pairsInfo.firstDateOfBirth))
                            .font(customFont: .spaceGroteskRegular, size: 12)
                            .foregroundStyle(Color.whiteColor)
                            .padding(.leading, 18)
                        
                        Image(viewModel.signOfPerson(dateOfBirth: pairsInfo.firstDateOfBirth))
                            .frame(width: 16, height: 16)
                            .padding(.leading, 2)
                            .padding(.trailing, 18)
                    }
                    .padding(.vertical, 6)
                    .background(Color.astroSignBackgroundColor
                        .cornerRadius(600)
                    )
                    
                    HStack(spacing: 0) {
                        Text(viewModel.signOfPerson(dateOfBirth: pairsInfo.secondDateOfBirth))
                            .font(customFont: .spaceGroteskRegular, size: 12)
                            .foregroundStyle(Color.whiteColor)
                            .padding(.leading, 18)
                        
                        Image(viewModel.signOfPerson(dateOfBirth: pairsInfo.secondDateOfBirth))
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
                .padding(.top, 20)
//                .padding(.bottom, 16)
            }
            
//            Spacer()
        }
//        .background(Image("cardBackground")
//            .aspectRatio(contentMode: .fit))
        
        Spacer()
    }
        
    
}

#Preview {
    PairsView(buttonClicked: {}, pairsInfo: PairsInfo(typeOfRelation: "Love", firstName: "1", firstDateOfBirth: Date(), firstTimeOfBirth: Date(), firstCityOfBirth: "1", secondName: "1", secondDateOfBirth: Date(), secondTimeOfBirth: Date(), secondCityOfBirth: "1"), percentage: "84%")
}
