//
//  RegistrationView.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//
import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
   @EnvironmentObject var authViewModel: AuthViewModel
   @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
       AuthHeaderView(title1: "Get Started", title2: "Create your account")
            
            VStack(spacing: 40){
                CustomInputField(ImageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                CustomInputField(ImageName: "person", placeholderText: "Username", isSecureField: false, text: $username)
                CustomInputField(ImageName: "person", placeholderText: "Full Name", isSecureField: false, text: $fullname)
                CustomInputField(ImageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button{
               authViewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
        Spacer()
            
            Button{
               // presentationMode.wrappedValue.dismiss()
            }label:{
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
}
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

