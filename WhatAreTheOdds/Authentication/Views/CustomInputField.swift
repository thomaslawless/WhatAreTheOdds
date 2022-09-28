//
//  CustomInputField.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//

import SwiftUI

struct CustomInputField: View {
    let ImageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: ImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField != false {
                    SecureField(placeholderText, text: $text)
                }else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(ImageName: "envelope", placeholderText: "Email",isSecureField: false, text: .constant(""))
    }
}
