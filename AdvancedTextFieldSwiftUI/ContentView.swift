//
//  ContentView.swift
//  AdvancedTextFieldSwiftUI
//
//  Created by Ramill Ibragimov on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var isValidEmail = false
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Enter email", text: $email, onEditingChanged: { change in
                print("onEditingChanged: \(change)")
            }) {
                print("onCommit")
            }
            //.modifier(NeomorphicTextFieldModifier())
            .neumorphicTextField()
            .onChange(of: email, perform: { value in
                if value.contains("@") {
                    isValidEmail = true
                } else {
                    isValidEmail = false
                }
            })
            
            Text(email)
                .bold()
                .foregroundColor(isValidEmail ? Color(.systemGray2) : .red)
            
            if isValidEmail {
                Button(action: {
                    hideKeyboard()
                }, label: {
                    Text("Login")
                        .bold()
                })
            }
            Spacer()
        }.padding()
    }
}

struct NeomorphicTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.accentColor)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            //.background(Color.gray.opacity(0.2))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray2), lineWidth: 2)
                    )
            )
    }
}

extension View {
    func neumorphicTextField() -> some View {
        modifier(NeomorphicTextFieldModifier())
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
