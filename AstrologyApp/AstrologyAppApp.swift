//
//  AstrologyAppApp.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI
import SwiftData

@main
struct AstrologyAppApp: App {
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: PairsInfo.self)
        } catch {
            fatalError("Не удалось создать ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(container)
    }
}
