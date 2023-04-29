//
//  SignInViewModel.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/26/23.
//

import Foundation

class SignInViewModel{
    var delegate: SignInDelegate?
    func signInUser(email: String, password: String){
        if email == "mark@email.com" && password == "password"{
            delegate?.signInUser()
        }else{
            delegate?.signInFailure()
        }
    }
}


 protocol SignInDelegate{
    func signInUser()
    func signInFailure()
}
