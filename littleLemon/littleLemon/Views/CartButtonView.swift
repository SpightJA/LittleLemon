//
//  CartButtonView.swift
//  littleLemon
//
//  Created by Jon Spight on 2/25/24.
//

import SwiftUI

struct CartButtonView: View {
    var numOfItems : Int
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
//                .frame(width: 100, height: 100)
            
            if(numOfItems > 0){
                Text("\(numOfItems)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(width: 15, height: 15)
                    .background(Color.primary1)
                    .cornerRadius(50)
                    
                    
                    
            }
        }
    }
}

#Preview {
    CartButtonView(numOfItems: 3)
}
