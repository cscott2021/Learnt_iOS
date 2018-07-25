//
//  userLogin.swift
//  Learnt
//
//  Created by Caleb Scott on 7/24/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Auth0
class userLogin: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signIn: UIButton!
    @IBAction func login(){
        if email.text != "" && password.text != "" {
        Auth0
            .authentication()
            .login(
                usernameOrEmail: email.text!,
                password: password.text!,
                realm: "Username-Password-Authentication",
                scope: "openid")
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Obtained credentials: \(credentials)")
                case .failure(let error):
                    print("Failed with \(error)")
                }
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
    }
    
    
}
