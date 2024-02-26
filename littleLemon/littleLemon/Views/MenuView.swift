//
//  MenuView.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    @State private var isSearching = false
    @State private var startersIsEnabled = true
    @State private var mainsIsEnabled = true
    @State private var dessertsIsEnabled = true
    @State private var drinksIsEnabled = true
//    @Binding  var isLoggedOn: Bool
    
    var body: some View {
        NavigationStack {
        VStack (alignment: .center){

            NavigationHeaderView()
                .frame(height: 50)
            VStack{
                HeroVIew()
                
                if (isSearching) {
                    HStack {
                        TextField("Search", text: $searchText, onEditingChanged: { editing in
                            isSearching = editing
                        })
                        .textFieldStyle(.roundedBorder)
                        
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.highlight1)
                            .onTapGesture {
                                withAnimation{
                                    isSearching = false
                                    searchText = ""
                                }
                            }
                    }
                    .padding()
                } else {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.highlight1)
                            .padding(.leading)
                            .onTapGesture {
                                withAnimation {
                                    isSearching = true
                                }
                            }
                        Spacer()
                    }
                    .padding()
                }
            }
            .background(.primary1)
            Text("Order for Delivery!")
                .foregroundColor(.highlight2)
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Stareters", isOn: $startersIsEnabled)
                    Toggle("Mains", isOn: $mainsIsEnabled)
                    Toggle("Desserts", isOn: $dessertsIsEnabled)
                    Toggle("Drinks", isOn: $drinksIsEnabled)
                }
                .padding(.horizontal)
                .toggleStyle(CategoryToggleStyle())
                
            }
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id:\.self) { dish in
                        //                            let myString = "556"
                        let myFloat = (dish.price! as NSString).doubleValue;           NavigationLink(destination: DishDetailView(dish: dish, total: myFloat, increment: myFloat)) {
                            DishListView(dish: dish)
                        }
                        
                    }
                }
                
            }
            
            .onAppear(){
                getMenuData()

            }
            
        }
    }
    }
    func buildPredicate() -> NSPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    
    }
    func buildSortDescriptors() -> [NSSortDescriptor] {
        
        return [NSSortDescriptor(key: "title", ascending: true,selector:  #selector(NSString.localizedStandardCompare))]
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuURL = URL(string: menuAddress)!
        let request = URLRequest(url: menuURL)
        let task = URLSession.shared.dataTask(with: request){data, response, err in
            if let data = data {
                let decoder = JSONDecoder()
                let fullMenu = try? decoder.decode(MenuList.self, from: data)
//                print(fullMenu?.menu ?? "Nothing to see")
                fullMenu?.menu.forEach({item  in
                    let newDish = Dish(context: viewContext)
                    newDish.image = item.image
                    newDish.price = item.price
                    newDish.title = item.title
                    newDish.descrip = item.description
                    newDish.category = item.category
                    print(newDish)
                })
                try? viewContext.save()
            }
        }
        task.resume()
    }
    
    
    struct CategoryToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button {
                configuration.isOn.toggle()
            } label: {
                HStack {
                    configuration.label
                }
            }
            .foregroundColor(Color.primary1)
            .padding(5)
            .background {
                if configuration.isOn {
                    Color.primary2
                }
            }
            .cornerRadius(8)
        }
    }
    
    
}

#Preview {
    MenuView()
}
