//
//  OrderRow.swift
//  RestaurantMobileApp
//
//  Created by Jon Spight on 2/26/24.
//

import SwiftUI

struct OrderRow: View {
    @EnvironmentObject var cartMonitor : CartMonitor
    var order: Dish
    var body: some View {
        HStack(spacing: 20 ){
            AsyncImage(url: URL(string: order.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(order.title ?? "N/A")
                    .bold()
                
                Text("$\(order.price ?? "0.00")")
            }
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(.primary1)
                .onTapGesture {
                    cartMonitor.removeFromCart(dish: order)
                }
                .padding(.trailing, 10)
        }
        .padding(.horizontal)
        .frame(width: .infinity, alignment: .leading)
    }
}

#Preview {
    OrderRow(order: PersistenceController.getExampleDish())
        .environmentObject(CartMonitor())
}
