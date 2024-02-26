//
//  NavigationHeader.swift
//  littleLemon
//
//  Created by Jon Spight on 2/2/24.
//

import SwiftUI

struct NavigationHeaderView: View {
    var body: some View {
        NavigationView {
        HStack() {
            Spacer()
            Image(.profilePic).resizable()
                .frame(width: 50, height: 50, alignment: .center)
//                .padding(.trailing, 70)

            
            Spacer()
            Image(.logoPH).resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.trailing, 70)
                .padding(.leading, 70)
            
            Spacer()
            NavigationLink(destination:UserProfileView() ) {
                Image(systemName: "cart.circle.fill").resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.primary1)
//                    .padding(.leading, 20)
                
            }
            Spacer()
            
            
        }

        }
    }
}

#Preview {
    NavigationHeaderView()
}
