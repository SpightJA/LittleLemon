//
//  CartView.swift
//  littleLemon
//
//  Created by Jon Spight on 2/25/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartMonitor: CartMonitor
    
    var body: some View {
        ScrollView{
            if(cartMonitor.dishes.count > 0){
                ForEach(cartMonitor.dishes, id: \.id){ dish in
                    OrderRow( order: dish)
                }
                HStack{
                    Spacer()
                    Text("Your cart total is:")
                    
                    Spacer()
                    Text("$\(cartMonitor.total)")
                        .bold()
                    Spacer()
                }
            }
            else{ 
                Text("Your cart is empty ")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartMonitor())
}
