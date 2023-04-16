//
//  LoginView.swift
//  FirebaseSwiftUIAuth
//
//  Created by Matthew Dolan on 2023-04-13.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Password",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "locke")
            }
            
            HStack {
                Spacer()
                Button(action: {
                    // TODO: Handle presentation to forgot password
                }, label: {
                    Text("Forgot Password?")
                })
                .font(.system(size: 16,
                              weight: .bold))
            }
            
            VStack(spacing: 16) {
                ButtonView(title: "Login") {
                   // TODO: Handle login action here
                }
                
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: .blue,
                           border: .blue) {
                    // TODO: Handle presentation to registration
                }
            }
            
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
