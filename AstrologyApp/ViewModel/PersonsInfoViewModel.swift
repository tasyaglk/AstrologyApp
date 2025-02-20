//
//  PersonsInfoViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI

class PersonsInfoViewModel: ObservableObject {
    @Published var numOfPerson: String = "First Person"
    @Published var buttonTitle: String = "Next Person"
    @Published var numOfPage: Int = 0
    @Published var isNextView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    func buttonPressed() {
        if numOfPage == 0 {
            numOfPerson = "Second Person"
            buttonTitle = "Create Compatibility"
            numOfPage = 1
        } else {
            isNextView.toggle()
        }
    }
    
    func backButtonPressed() {
        numOfPerson = "First Person"
        buttonTitle = "Next Person"
        numOfPage = 0
    }
}
