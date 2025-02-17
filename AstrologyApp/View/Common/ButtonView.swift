//
//  ButtonView.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonClicked: (() -> Void)?
    var title: String
    var height: CGFloat
    
    var body: some View {
        Button(action: {
            buttonClicked?()
        }, label: {
            Text(title)
                .font(customFont: .spaceGroteskMedium, size: 12)
                .foregroundStyle(Color.backgroundColor)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: height)
                .background(Color.buttonColor)
                .cornerRadius(600)
        })
    }
    
    init(title: String, height: CGFloat = 40, buttonClicked: (() -> Void)? = nil) {
        self.title = title
        self.buttonClicked = buttonClicked
        self.height = height
    }
}
