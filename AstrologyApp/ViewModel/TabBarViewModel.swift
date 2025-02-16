//
//  TabBarViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var isTabBarHidden: Bool = false
}
