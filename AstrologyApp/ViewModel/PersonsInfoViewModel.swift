//
//  PersonsInfoViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import SwiftUI
import SwiftData
import MapKit

class PersonsInfoViewModel: NSObject, ObservableObject {
    @Published var numOfPerson: String = "First Person"
    @Published var buttonTitle: String = "Next Person"
    @Published var numOfPage: Int = 0
    @Published var isNextView: Bool = false
    @Published var pairsInfo: PairsInfo = PairsInfo(
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
    @Published var selectedOption: String = "Love"
    let options = ["Love", "Friendship", "Work"]
    
    @Published var searchResults: [SimpleLocation] = []
    private let completer = MKLocalSearchCompleter()
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    
    override init() {
        super.init()
        
        completer.resultTypes = .address
        completer.delegate = self
    }
    
    func buttonPressed() {
        guard validateCurrentStep() else {
            showAlert = true
            return
        }
        
        if numOfPage == 0 {
            numOfPerson = "Second Person"
            buttonTitle = "Create Compatibility"
            numOfPage = 1
        } else {
            isNextView.toggle()
        }
    }
    
    private func validateCurrentStep() -> Bool {
        if numOfPage == 0 {
            return !pairsInfo.firstName.isEmpty &&
            !pairsInfo.firstCityOfBirth.isEmpty &&
            pairsInfo.firstDateOfBirth < Date() &&
            pairsInfo.firstTimeOfBirth < Date()
        } else {
            return !pairsInfo.secondName.isEmpty &&
            !pairsInfo.secondCityOfBirth.isEmpty &&
            pairsInfo.secondDateOfBirth < Date() &&
            pairsInfo.secondTimeOfBirth < Date()
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
    
    func locationText(location: SimpleLocation) -> String {
        var text = "\(location.city)"
        if let state = location.state {
            text += ", \(state)"
        }
        text += ", \(location.country)"
        return text
    }
    
    func performSearch(query: String) {
        guard !query.isEmpty else {
            searchResults = [] 
            return
        }
        completer.queryFragment = query
    }
    
    func getCityList(results: [MKLocalSearchCompletion]) -> [SimpleLocation] {
        
        // create each location item, use the set to eliminate duplicates
        var searchResults: Set<SimpleLocation> = []
        
        let filtered = results.filter { !$0.subtitle.contains("Search Nearby") && !$0.subtitle.contains("No Results Nearby") }
        for result in filtered {
            
            let titleComponents = result.title.components(separatedBy: ", ")
            let subtitleComponents = result.subtitle.components(separatedBy: ", ")
            
            // creating a SimpleLocation from either MKLocalSearchCompletion format
            locationFromSearchCompletion(titleComponents, subtitleComponents) {place in
                if place.city != "" && place.country != "" {
                    searchResults.insert(place)
                }
            }
        }
        
        // sorting alphabetically by city, same city name will sort by state, with no state coming first
        let sorted = Array(searchResults).sorted { lhs, rhs in
            if lhs.city == rhs.city {
                return lhs.state ?? "" < rhs.state ?? ""
            }
            return lhs.city < rhs.city
        }
        return sorted
    }
    
    // there are twp possible location formats, this handles either and returns a SimpleLocation
    func locationFromSearchCompletion(_ title: [String],_ subtitle: [String], _ completion: @escaping (SimpleLocation) -> Void) {
        
        var city: String = ""
        var state: String?
        var country: String = ""
        
        if title.count > 1 && subtitle.count > 1 {
            
            city = title.first!
            state = title[1]
            country = subtitle.count == 1 && subtitle[0] != "" ? subtitle.first! : title.last!
        } else {
            if title.count >= 1 && subtitle.count == 1 {
                
                city = title.first!
                if title.count > 1 {
                    state = title[1]
                }
                country = subtitle.last!
            }
        }
        completion(SimpleLocation(city: city, state: state, country: country))
    }
    
    func selectCity(_ city: String) {
        if numOfPage == 0 {
            pairsInfo.firstCityOfBirth = city
        } else {
            pairsInfo.secondCityOfBirth = city
        }
        searchResults = []
    }
}

extension PersonsInfoViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let results = completer.results
        searchResults = getCityList(results: results)
    }
}
