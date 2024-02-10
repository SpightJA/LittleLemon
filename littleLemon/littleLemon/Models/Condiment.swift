//
//  Condiment.swift
//  littleLemon
//
//  Created by Jon Spight on 2/9/24.
//

import Foundation
struct Condiment : Identifiable {
    var id = UUID()
    let name: String
    let priceVal: Double
    let price: String
}
