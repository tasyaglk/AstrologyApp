//
//  TabBarView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        ZStack{
            
            TabView(selection: $viewModel.selectedIndex,content:  {
                Group {
                    NavigationStack {
                        AnotherView()
                    }
                    .tag(0)
                    
                    NavigationStack {
                        AnotherView()
                    }
                    .tag(1)
                    
                    NavigationStack {
                        CompatabilityView()
                    }
                    .tag(2)
                    
                    NavigationStack {
                        AnotherView()
                    }
                    .tag(3)
                }
                .toolbar(.hidden, for: .tabBar)
            })
            
            if !viewModel.isTabBarHidden {
                VStack{
                    Spacer()
                    tabBar
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }
    
    private var tabBar: some View {
        HStack {
            VStack {
                Image(.today)
                    .frame(width: 24, height: 24)
                Text("Today")
                    .font(customFont: .spaceGroteskMedium, size: 12)
                    .foregroundColor(viewModel.selectedIndex == 0 ? Color.purpleColor : Color.grayColor)
            }
            .onTapGesture {
                viewModel.selectedIndex = 0
            }
            .frame(width: 93)
            
            Spacer()
            
            VStack {
                Image(.practice)
                    .foregroundColor((viewModel.selectedIndex == 1) ? Color.purpleColor : Color.grayColor)
                    .frame(width: 24, height: 24)
                Text("Practice")
                    .font(customFont: .spaceGroteskMedium, size: 12)
                    .foregroundColor(viewModel.selectedIndex == 1 ? Color.purpleColor : Color.grayColor)
            }
            .onTapGesture {
                viewModel.selectedIndex = 1
            }
            .frame(width: 93)
            
            Spacer()
            
            VStack {
                Image(viewModel.selectedIndex == 2 ? .compatabilityFill : .compatability)
                    .frame(width: 24, height: 24)
                    .foregroundColor((viewModel.selectedIndex == 2) ? Color.purpleColor : Color.grayColor)
                Text("Compatability")
                    .font(customFont: .spaceGroteskMedium, size: 12)
                    .foregroundColor(viewModel.selectedIndex == 2 ? Color.purpleColor : Color.grayColor)
            }
            .onTapGesture {
                viewModel.selectedIndex = 2
            }
            .frame(width: 93)
            
            Spacer()
            
            VStack {
                Image(.me)
                    .frame(width: 24, height: 24)
                    .foregroundColor((viewModel.selectedIndex == 3) ? Color.purpleColor : Color.grayColor)
                Text("Me")
                    .font(customFont: .spaceGroteskMedium, size: 12)
                    .foregroundColor(viewModel.selectedIndex == 3 ? Color.purpleColor : Color.grayColor)
            }
            .onTapGesture {
                viewModel.selectedIndex = 3
            }
            .frame(width: 93)
        }
        .frame(height: 75)
        .padding(.bottom, 14)
        .background(Color.blackColor)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 12,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 12
            )
        )
    }
}


