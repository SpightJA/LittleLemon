//
//  UserProfile.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct UserProfileView: View {
    let firstName = UserDefaults.standard.string(forKey: "firstNameKey")
    let lastName = UserDefaults.standard.string(forKey: "lastNameKey")
    let email = UserDefaults.standard.string(forKey: "emailKey")
    @Environment(\.presentationMode) var presentation
    @State private var isOn1 = false
    @State private var isOn2 = false
    @State private var isOn3 = false
    @State private var isOn4 = false
    @EnvironmentObject var cartMonitor : CartMonitor
    
    var body: some View {
        VStack (){
            NavigationHeaderView()
                .frame(height: 50)
          
//            Image(.logoPH).resizable()
//                .frame(width: 50, height: 50, alignment: .center)
            Spacer()
            Text("Personal information")
                .fontWeight(.bold)
            Image(.profilePic)
            HStack{
                
                Button("Change"){
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.primary2)
                .foregroundStyle(.primary1)
                Button("Remove"){
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.primary2)
                .foregroundStyle(.primary1)
                
            }
            Text("\(firstName ?? " ")")
            Text("\(lastName ?? " ")")
            Text(" \(email ?? " ")")
                .padding(.bottom, 50)
            
            VStack(alignment: .leading){

                Text("Email Notifications")
                    .fontWeight(.bold)
                    
                    Toggle(isOn: $isOn1) {
                                Text("Order Statuses")
                            }
                    Toggle(isOn: $isOn2) {
                                Text("Password changes")
                            }
                    Toggle(isOn: $isOn3) {
                                Text("Special Offers")
                            }
                    Toggle(isOn: $isOn4) {
                                Text("Newsletter")
                            }
            }.padding()
            
            Spacer()
            Button(action:  {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
                
            }){
                Text("Log out")
                    .fontWeight(.bold)
                    .foregroundStyle(.primary1)
                    .frame(maxWidth: 300)
                    
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.primary2)

        }
    }
}

#Preview {
    UserProfileView()
        .environmentObject(CartMonitor())
}
