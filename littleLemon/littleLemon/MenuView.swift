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
 
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Your new favorite spot! ")
            TextField("Search menu", text: $searchText)
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id:\.self) { dish in
                        HStack{
                            // change cards to nav links and change black boxes to actual photos
                            Text(dish.title ?? "JON ")
                            Spacer()
                            let dishUrl = URL(string: dish.image!)
                            AsyncImage(url: dishUrl){
                                image in
                                image.image?.resizable()
                                    .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                            }
                            .listRowInsets(EdgeInsets())

                            
                                
                        }

                    }
                }

            }

        }
        .onAppear(){
            getMenuData()
        }
    }
    func buildPredicate() -> NSPredicate {
        if (searchText.isEmpty) {
            return NSPredicate(value: true)
        }
    
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
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
                    print(newDish)
                })
                try? viewContext.save()
            }
        }
        task.resume()
    }
}

#Preview {
    MenuView()
}
