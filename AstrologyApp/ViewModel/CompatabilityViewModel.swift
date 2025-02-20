//
//  CompatabilityViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

class CompatabilityViewModel: ObservableObject  {
    @Published var pairs: [String?] = []
    @Published var isNextView: Bool = false
    
    func addPair() {
        isNextView.toggle()
    }
    
    func startCompatibility() {
        print("start")
    }
}
