import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            NavigationHeaderView()
                .frame(height: 50)
            
            Text (model.displayingReservationForm ? "Reservation Details" :
                    "Select a location")
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            
            NavigationView {
                // EmptyView()
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant).environmentObject(model)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
            .onDisappear{
                if model.tabBarChanged { return }
                // this changes the phrase from "Select a location"
                // to "RESERVATION"
                model.displayingReservationForm = true
            }
            
            .frame(maxHeight: .infinity)

            .padding(.top, -10)
            
            .scrollContentBackground(.hidden)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
