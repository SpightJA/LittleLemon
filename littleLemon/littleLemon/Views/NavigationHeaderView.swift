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
            Image(.logoPH).resizable()
                .frame(width: 50, height: 50).padding(.leading, 80)
                
            Spacer()
            Image(.profilePic).resizable()
                .frame(width: 50, height: 50).padding(.trailing, 30.0)
        }    }
}

#Preview {
    NavigationHeaderView()
}
