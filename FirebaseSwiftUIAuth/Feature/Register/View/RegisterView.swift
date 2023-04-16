//
//  RegisterView.swift
//  FirebaseSwiftUIAuth
//
//  Created by Matthew Dolan on 2023-04-16.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
        } 
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
