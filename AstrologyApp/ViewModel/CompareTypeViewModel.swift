//
//  CompareTypeViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI

class CompareTypeViewModel: ObservableObject  {
    @Published var isNextView: Bool = false
    
    func addPair() {
        isNextView.toggle()
    }
    
}
