//
//  TimePickerView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 21.02.2025.
//

import SwiftUI

struct TimePickerView: View {
    @Binding var timeOfBirth: Date
    @State var showDatePicker: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Time of birth")
                .font(customFont: .spaceGroteskMedium, size: 14)
                .foregroundColor(Color.whiteColor)
                .padding(.leading, 16)
                .padding(.top, 12)
                .padding(.bottom, 12)
            
            Spacer()
            
            Text(timeOfBirth.formatted(date: .omitted, time: .shortened))
                .font(customFont: .spaceGroteskMedium, size: 14)
                .foregroundColor(Color.whiteColor)
                .padding(.trailing, 16)
                .padding(.top, 12)
                .padding(.bottom, 12)
        }
        .background(Color.rowBackgroundColor)
        .cornerRadius(7)
        .onTapGesture {
            showDatePicker.toggle()
        }
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker("", selection: $timeOfBirth, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
            }
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }
}
