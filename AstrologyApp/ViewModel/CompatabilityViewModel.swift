//
//  CompatabilityViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

class CompatabilityViewModel: ObservableObject  {
    @Published var pairs: [String?] = []
    
    func addPair() {
        print("add")
    }
    
    func startCompatibility() {
        print("start")
    }
}
