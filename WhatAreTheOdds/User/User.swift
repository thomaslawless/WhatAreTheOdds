//
//  User.swift
//  WhatAreTheOdds
//
//  Created by Thomas Lawless III on 9/28/22.
//
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
   // let profileImageUrl: String
    let email: String
}
