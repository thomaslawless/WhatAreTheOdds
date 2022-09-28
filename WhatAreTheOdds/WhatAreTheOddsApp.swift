//
//  WhatAreTheOddsApp.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//

import SwiftUI
import Firebase

@main
struct WhatAreTheOddsApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RegistrationView()
        }
    }
}
