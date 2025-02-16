//
//  CustomFonts.swift
//  AstrologyApp
//
//  Created by Тася Галкина on 17.02.2025.
//

import SwiftUI

enum CustomFonts: String {
    case spaceGroteskMedium = "SpaceGrotesk-Medium"
}

extension Font {
    fileprivate static func custom(_ customFont: CustomFonts, size: CGFloat) -> Font {
        Font.custom(customFont.rawValue, size: size)
    }
}

extension Text {
    func font(customFont: CustomFonts, size: CGFloat) -> Text {
        self.font(Font.custom(customFont, size: size))
    }
}
