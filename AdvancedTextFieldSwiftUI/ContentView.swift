//
//  ContentView.swift
//  AdvancedTextFieldSwiftUI
//
//  Created by Ramill Ibragimov on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Enter email", text: $email, onEditingChanged: { change in
                print("onEditingChanged: \(change)")
            }) {
                print("onCommit")
            }
            Text(email)
                .bold()
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
