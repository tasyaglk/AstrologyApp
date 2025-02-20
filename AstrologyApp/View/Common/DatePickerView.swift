//
//  DatePickerView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 21.02.2025.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var dateOfBirth: Date
    @State var showDatePicker: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Date of birth")
                .font(customFont: .spaceGroteskMedium, size: 14)
                .foregroundColor(Color.whiteColor)
                .padding(.leading, 16)
                .padding(.top, 12)
                .padding(.bottom, 12)
            
            Spacer()
            
            Text(dateOfBirth.formatted(date: .abbreviated, time: .omitted))
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
                DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
            }
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }
}

