//
//  LoginView.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Hello!", title2: "Welcome Back")
            //rounded shape?
            
            VStack(spacing: 40){
                CustomInputField(ImageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                
                CustomInputField(ImageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("reset passwrd view")
                }label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            Button{
                $viewModel.login(withEmail: email, password: password)
                
            }label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

