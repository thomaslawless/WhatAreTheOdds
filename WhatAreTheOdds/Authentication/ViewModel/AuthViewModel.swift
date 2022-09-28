//
//  AuthViewModel.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//
import Firebase
import SwiftUI

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenicateUser = false
    //@Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
   
    
    // private let service = UserService()
    /*
    init(){
        self.userSession = Auth.auth().currentUser
       // self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
         //   self.fetchUser()
        }
    }
     */
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to register user with error \(error.localizedDescription)")
                return
            }
          
            guard let user = result?.user else {return}
            self.tempUserSession = user
            self.userSession = user
           
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "UId": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    self.didAuthenicateUser = true
                }
        }
    }
    
}
