//
//  PersonsInfoViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI
import SwiftData

class PersonsInfoViewModel: ObservableObject {
    @Published var numOfPerson: String = "First Person"
    @Published var buttonTitle: String = "Next Person"
    @Published var numOfPage: Int = 0
    @Published var isNextView: Bool = false
    @Published var pairsInfo: PairsInfo
    @Published var selectedOption: String = "Love"
    let options = ["Love", "Friendship", "Work"]
    
    init() {
        self.pairsInfo = PairsInfo(
            typeOfRelation: "",
            firstName: "",
            firstDateOfBirth: Date(),
            firstTimeOfBirth: Date(),
            firstCityOfBirth: "",
            secondName: "",
            secondDateOfBirth: Date(),
            secondTimeOfBirth: Date(),
            secondCityOfBirth: ""
        )
    }
    
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
    
    func addPair() {
        isNextView.toggle()
    }
    
    func selectOption(_ option: String) {
        selectedOption = option
        pairsInfo.typeOfRelation = option
    }
    
    func saveData(modelContext: ModelContext) {
        modelContext.insert(pairsInfo)
    }
}
