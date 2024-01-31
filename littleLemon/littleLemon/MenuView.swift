//
//  MenuView.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Your new favorite spot! ")
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

#Preview {
    MenuView()
}
