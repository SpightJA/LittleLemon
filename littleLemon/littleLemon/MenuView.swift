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
            NavigationHeaderView()
            VStack (alignment: .leading){
                Text("Little lemon")
                    .foregroundStyle(Color(.primary2))
                    .font(Font.custom("MarkaziText-Medium", size: 48))
                    .padding(.leading, 10)
                    
                HStack {
                    VStack(alignment: .leading){
                        Text("Chicago")
                            .foregroundStyle(Color(.highlight1))
                            .font(Font.custom("MarkaziText-Regular", size: 28))
                            .padding(.leading, 10)
                            .padding(.top, -35)
                            .padding(.bottom, 25)
                        Text("We are a family owned Mediterranean resturant, focused on traditional recipes served with a modern twist.")
                            .foregroundStyle(Color(.highlight1))
                            .font(Font.custom("Karla Regular", size: 18))
                            .padding(.leading, 10)
//                            .padding(.bottom, 35 )
                    }
                    
                        
                    Image(.hero)
                        .resizable()
                        .frame(width: 160,height: 170)
                        .cornerRadius(25.0)
                        .padding(.top, 0)
                        
                }

                    TextField("Search menu", text: $searchText)
                        .frame(width: 350, height: 35)
                        .background(Color(.highlight1))
                    
                
                .padding()
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors())
                { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            HStack{
                                // change cards to nav links and change black boxes to actual photos
                                VStack(alignment: .leading){
                                    Text("\(dish.title ?? "Loading...")")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color(.highlight2))
                                        .font(Font.custom("Karla Bold", size: 18)).bold()
                                    Text("\(dish.descrip ?? "")")
                                        .font(Font.custom("Karla Regular", size: 14))
                                        .foregroundStyle(Color(.highlight2))
                                    Text("$\(dish.price ?? "5").99")
                                        .font(Font.custom("Karla Regular", size: 14))
                                        .foregroundStyle(Color(.highlight2))
                                }
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
            .background(Color(.primary1))
            .onAppear(){
                getMenuData()
            }
            
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
                    newDish.descrip = item.description
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
