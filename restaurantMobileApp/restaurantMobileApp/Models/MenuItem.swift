//
//  MenuItem.swift
//  RestaurantMobileApp
//
//  Created by Jon Spight on 1/31/24.
//

import Foundation

struct MenuItem : Decodable{
    let title : String
    let image : String
    let price : String
    let description : String
    let category: String
}
