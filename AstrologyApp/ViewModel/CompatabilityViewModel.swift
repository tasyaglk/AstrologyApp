//
//  CompatabilityViewModel.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI
import SwiftData

class CompatabilityViewModel: ObservableObject {
    @Published var pairs: [PairsInfo] = []
    @Published var isNextView: Bool = false
    private var modelContext: ModelContext? 
    
    init() {}
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchPairs()
    }
    
    func fetchPairs() {
        guard let modelContext = modelContext else {
            print("ModelContext не установлен")
            return
        }
        
        do {
            let descriptor = FetchDescriptor<PairsInfo>()
            pairs = try modelContext.fetch(descriptor)
        } catch {
            print("Ошибка загрузки данных:", error.localizedDescription)
        }
    }
    
    func addPair() {
        isNextView.toggle()
    }
    
    func startCompatibility() {
        print("Список пар:", pairs.map { $0.secondName })
    }
    
    func deletePair(pairs: PairsInfo) {
        guard let modelContext = modelContext else {
            print("ModelContext не установлен")
            return
        }
        
        modelContext.delete(pairs)
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
        fetchPairs()
    }
}
