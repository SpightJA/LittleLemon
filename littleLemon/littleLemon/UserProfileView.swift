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
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            Text(firstName ?? " ")
            Text(lastName ?? " ")
            Text(email ?? " ")
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfileView()
}
