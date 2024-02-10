//
//  DishDetailView.swift
//  littleLemon
//
//  Created by Jon Spight on 2/9/24.
//

import SwiftUI

struct DishDetailView: View {
    
    let dish: Dish
    @State private var feta = false
    @State private var parmesan = false
    @State private var dressing = false
    @State private var cheese = false
    @State private var onions = false
    @State private var bread = false
    @State var total : Double
    @State var val : Double  = 0.0
    @State var count = 1
    let increment : Double
    
    var body: some View {

        VStack{
            NavigationHeaderView()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 100)
        }
        VStack{
            
            Text(dish.title ?? "")
                .font(.system(size: 26))
                .foregroundColor(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(dish.descrip ?? "")
                .font(.subtitleText())
            
            Spacer(minLength: 10)
            HStack{
                Image(systemName: "car.side").padding(.leading)
                Spacer(minLength:1 )
                Text("Delivery Time:")
                Text("20 minutes").bold()
                Spacer()
                Button(action:  {
      
                }){
                    Text("Change")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary1)
                        .frame(maxWidth: 300)
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.primary2)
                Spacer(minLength: 20)
            }
//            Text("$\(dish.price ?? "")")
//                .font(Font.custom("Karla Regular", size: 14))
//                .foregroundColor(.primaryColorDarkGray)
//                .monospaced()
//            Spacer()
            HStack{
                Text("Add").bold().padding()
                Spacer()
            }
            ScrollView {
                
                VStack{
                    
                    Toggle("feta", isOn: $feta)
                        .onChange(of: feta){
                            if feta {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                    Divider()
                    Toggle("parmesan", isOn: $parmesan)
                        .onChange(of: parmesan){
                            if parmesan {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                    Divider()
                    Toggle("Dressing", isOn: $dressing)
                        .onChange(of: dressing){
                            if dressing {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                    Divider()
                    Toggle("Cheese", isOn: $cheese)
                        .onChange(of: cheese){
                            if cheese {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                    Divider()
                    Toggle("Onions", isOn: $onions)
                        .onChange(of: onions){
                            if onions {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                    Divider()
                    Toggle("bread", isOn: $bread)
                        .onChange(of: bread){
                            if bread {
                                total += 1.0
                            }else{
                                total -= 1.0
                            }
                        }
                }   .padding()
                    .font(.regularTextMedium())
                    .toggleStyle(CheckboxToggleStyle())
            }

            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            HStack{
                Spacer()

                Button("-"){
                    if count > 1 {
                        count -= 1
                        total -= increment
                    }

                }
                .foregroundStyle(.black)
                .font(.system(size: 36))
                Spacer()
                Text("\(count)")
                    .bold()
                    .font(.system(size: 36))
                    .foregroundColor(.primary1)
                Spacer()

                Button("+"){
                    count += 1
                    total += increment
                }
                .foregroundColor(.black)
                .font(.system(size: 36))
                Spacer()

            }
            Spacer()
            Button(action:  {
  
            }){
                Text("Add for \(total , specifier: "%.2f")")
                    .fontWeight(.bold)
                    .foregroundStyle(.primary1)
                    .frame(maxWidth: 300)
                    
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.primary2)
        }
    }
    
    
    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button {
                
                configuration.isOn.toggle()
            } label: {
                HStack {
                    configuration.label
                    Spacer()
                    Text("$1.00")
                    Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                        .imageScale(.large)
                        .foregroundColor(.primary1)
                        .padding(.trailing)
                }
                .padding(.bottom)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    DishDetailView(dish: PersistenceController.getExampleDish(), total: 10.00, increment: 10.00)
}
