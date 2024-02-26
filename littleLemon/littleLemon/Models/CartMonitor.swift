//
//  CartMonitor.swift
//  littleLemon
//
//  Created by Jon Spight on 2/26/24.
//

import Foundation

class CartMonitor: ObservableObject {
    
    @Published var dishes: [Dish] = []
    @Published var total : Int = 0
    
    func addToCart (dish: Dish){
        dishes.append(dish)
        total += Int(dish.price ?? "2") ?? 2
    }
    // will need to figure out a better way of incorporating price changes
    // customizatoin of dishes varies the price
    // IDEA - once added to cart that dish object is turned into an Order object,
    //         cart monitor is based on order objects instead of dish objects
    func removeFromCart (dish: Dish){
        dishes = dishes.filter{$0.title != dish.title}
        total -= Int(dish.price ?? "2") ?? 2
    }
}
