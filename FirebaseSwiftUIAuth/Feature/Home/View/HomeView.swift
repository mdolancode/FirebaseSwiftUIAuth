//
//  HomeView.swift
//  FirebaseSwiftUIAuth
//
//  Created by Matthew Dolan on 2023-04-16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading,
               spacing: 16) {
            
            VStack(alignment: .leading,
                   spacing: 16) {
                Text("First Name: <Placeholder>")
                Text("First Name: <Placeholder>")
                Text("First Name: <Placeholder>")
            }
            
            ButtonView(title: "Logout") {
                // TODO: Handle logout action here
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main ContentView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
