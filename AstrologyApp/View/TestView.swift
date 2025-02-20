//
//  TestView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 20.02.2025.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var selectedOption: String? = nil
    let options = ["Любовь", "Дружба", "Работа"]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(options, id: \.self) { option in
                HStack {
                    // Кругляшок (индикатор выбора)
                    Circle()
                        .fill(selectedOption == option ? Color.blue : Color.clear)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    
                    // Текст варианта
                    Text(option)
                        .font(.largeTitle)
                        .foregroundColor(selectedOption == option ? .blue : .black)
                    
                    Spacer()
                }
                .contentShape(Rectangle()) // Делает всю область кликабельной
                .onTapGesture {
                    selectedOption = option
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
