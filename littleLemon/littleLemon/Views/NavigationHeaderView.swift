//
//  NavigationHeader.swift
//  littleLemon
//
//  Created by Jon Spight on 2/2/24.
//

import SwiftUI

struct NavigationHeaderView: View {
    var body: some View {
        HStack() {
            Spacer()
            Image(.logo).resizable()
                .frame(width: 200, height: 50).padding(.trailing, 10)
                
            
            Image(.profilePic).resizable()
                .frame(width: 50, height: 50).padding(.trailing, 30.0)
        }    }
}

#Preview {
    NavigationHeaderView()
}
