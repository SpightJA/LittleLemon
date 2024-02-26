//
//  DishListView.swift
//  RestaurantMobileApp
//
//  Created by Jon Spight on 2/9/24.
//

import SwiftUI

struct DishListView: View {
    
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.regularTextMedium())
                    .foregroundColor(.black)
                
                Spacer(minLength: 10)
                
                Text(dish.descrip ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.regularTextSmall())
                    .foregroundColor(.primaryColorDarkGray)
                    .lineLimit(2)
                
                Spacer(minLength: 5)
                
                Text("$\(dish.price ?? "")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.regularTextSmall())
                    .foregroundColor(.primaryColorDarkGray)
                    .monospaced()
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

#Preview {
    DishListView(dish: PersistenceController.getExampleDish())
}
