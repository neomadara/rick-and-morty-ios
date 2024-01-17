//
//  rickAndMortyAppApp.swift
//  rickAndMortyApp
//
//  Created by Cristian Gutiérrez on 16-12-23.
//

import SwiftUI

@main
struct rickAndMortyAppApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Home()
                    .environmentObject(network)
            }
        }
    }
}
