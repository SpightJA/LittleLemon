//
//  HeroVIew.swift
//  littleLemon
//
//  Created by Jon Spight on 2/2/24.
//

import SwiftUI

struct HeroVIew: View {
    var body: some View {
        HStack{
            VStack{
            Text("Name Here ")
                    .foregroundStyle(.primary2)
                .font(.largeTitleFont())
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("Location")
                    .foregroundStyle(Color(.primary2))
                    .font(.titleFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer(minLength: 5)
                
                Text("We are a family owned Mediterranean resturant, focused on traditional recipes served with a modern twist.")
                    .foregroundStyle(Color(.highlight1))
                    .font(.regularTextMedium())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                    
                Image(.hero)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 120)
                    .clipShape(Rectangle())
                    .cornerRadius(15)
                    
            }

        .background(.primary1)
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
}

#Preview {
    HeroVIew()
}
