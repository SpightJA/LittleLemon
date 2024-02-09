//
//  Onboarding.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "emailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    
    @State var firstName : String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {

                NavigationLink(destination: HomeView(), isActive: $isLoggedIn){
                    EmptyView()
                }
                Image(.logo).resizable()
                    .frame(width: 200, height: 50).padding(.trailing, 10)
                VStack (alignment: .leading){
                    Text("Little lemon")
                        .foregroundStyle(Color(.primary2))
                        .font(Font.custom("MarkaziText-Medium", size: 48))
                        .padding(.leading, 10)
                        
                    HStack {
                        VStack(alignment: .leading){
                            Text("Chicago")
                                .foregroundStyle(Color(.primary2))
                                .font(Font.custom("MarkaziText-Regular", size: 28))
                                .padding(.leading, 10)
                                .padding(.top, -20)
                                .padding(.bottom, 25)
                            Text("We are a family owned Mediterranean resturant, focused on traditional recipes served with a modern twist.")
                                .foregroundStyle(Color(.highlight1))
                                .font(Font.custom("Karla Regular", size: 18))
                                .padding(.leading, 10)
                                .padding(.bottom, 30 )
                        }
                        
                            
                        Image(.hero)
                            .resizable()
                            .frame(width: 160,height: 170)
                            .cornerRadius(25.0)
                            .padding(.top, 0)
                            .padding(.bottom, 30 )

                    }

                }
                .background(Color(.primary1))
                .frame(maxWidth: .infinity)
                
                
                HStack{
                    Text("First Name")
                        .foregroundStyle(Color.gray)
                    Spacer()
                }.padding()
                    
                TextField("First Name:", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: 2)
                    .padding()
                    .padding(.top, -35)
                HStack{
                    Text("Last Name*")
                        .foregroundStyle(Color.gray)
                    Spacer()
                }.padding()
                .padding(.top, -15)
                
                TextField("Last Name:", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: 2)
                    .padding()
                    .padding(.top, -35)
                HStack{
                    Text("Email*")
                        .foregroundStyle(Color.gray)
                    Spacer()
                }.padding()
                .padding(.top, -15)
                TextField("Email:", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: 2)
                    .padding()
                    .padding(.top, -35)
                
                Button(action:  {
                    //IDEA - add a check to validate email address!
                    if (!firstName.isEmpty &&
                        !lastName.isEmpty &&
                        !email.isEmpty ){
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                    }
                    else{
                        
                    }
                })
                {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary1)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.primary2)
                Spacer()
                
            }
            .onAppear(){
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
