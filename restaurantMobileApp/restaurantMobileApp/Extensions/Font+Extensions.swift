//
//  Font+Extensions.swift
//  RestaurantMobileApp
//  Created by JonSpight on 1/2/24.
//

import SwiftUI

extension Font {
    static func largeTitleFont() -> Font {
        return Font.custom("Markazi Text", size: 40).weight(.medium)
    }
    
    static func titleFont() -> Font {
        return Font.custom("Markazi Text", size: 32)
    }
    
    static func subtitleText() -> Font {
        return Font.custom("Markazi Text", size: 18)
    }
    
    static func regularTextLarge() -> Font {
        return Font.custom("Karla", size: 18)
    }
    
    static func regularTextMedium() -> Font {
        return Font.custom("Karla", size: 16)
    }
    
    static func regularTextSmall() -> Font {
        return Font.custom("Karla", size: 14)
    }
    
}
