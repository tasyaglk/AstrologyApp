//
//  PairsInfo.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 21.02.2025.
//

import SwiftData
import SwiftUI

@Model
class PairsInfo {
    var id: UUID
    var typeOfRelation: String
    
    var firstName: String
    var firstDateOfBirth: Date
    var firstTimeOfBirth: Date
    var firstCityOfBirth: String
    
    var secondName: String
    var secondDateOfBirth: Date
    var secondTimeOfBirth: Date
    var secondCityOfBirth: String
    

    init(
        id: UUID  = UUID(),
        typeOfRelation: String,
        firstName: String,
        firstDateOfBirth: Date,
        firstTimeOfBirth: Date,
        firstCityOfBirth: String,
        secondName: String,
        secondDateOfBirth: Date,
        secondTimeOfBirth: Date,
        secondCityOfBirth: String
    ) {
        self.id = id
        self.typeOfRelation = typeOfRelation
        self.firstName = firstName
        self.firstDateOfBirth = firstDateOfBirth
        self.firstTimeOfBirth = firstTimeOfBirth
        self.firstCityOfBirth = firstCityOfBirth
        self.secondName = secondName
        self.secondDateOfBirth = secondDateOfBirth
        self.secondTimeOfBirth = secondTimeOfBirth
        self.secondCityOfBirth = secondCityOfBirth
    }
}
