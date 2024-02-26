//
//  NavigationHeader.swift
//  littleLemon
//
//  Created by Jon Spight on 2/2/24.
//

import SwiftUI

struct NavigationHeaderView: View {
    @EnvironmentObject var cartMonitor : CartMonitor
    
    var body: some View {
        NavigationView {
        HStack() {
//            Spacer()
            Image(.profilePic).resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .padding(.leading, 30)

            
            Spacer()
            Image(.logoPH).resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .padding(.trailing, 5)
                .padding(.leading, 0)
            
            Spacer()
            NavigationLink(destination:CartView() ) {
                CartButtonView(numOfItems: cartMonitor.dishes.count)

                    .foregroundColor(.primary1)
//                    .padding(.leading, 70)
                    .padding(.trailing, 50)
                
            }
//            Spacer()
            
            
        }
//        .frame(height: 50)

        }
    }
}

#Preview {
    NavigationHeaderView()
        .environmentObject(CartMonitor())
}
