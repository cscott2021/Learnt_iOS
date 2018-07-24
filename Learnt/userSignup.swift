//
//  userSignup.swift
//  Learnt
//
//  Created by Caleb Scott on 7/24/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//
import UIKit
import Auth0
class userSignup: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirm: UITextField!

    @IBOutlet var signUpB: UIButton!
    @IBAction func signUp(){
        if email.text != "" && password.text != "" && confirm.text != "" {
            if password.text == confirm.text {
        Auth0
            .authentication()
            .createUser(
                email: email.text!,
                password: password.text!,
                connection: "Username-Password-Authentication",
                userMetadata: ["first_name": "First",
                               "last_name": "Last"]
            )
            .start { result in
                switch result {
                case .success(let user):
                    print("User Signed up: \(user)")
                case .failure(let error):
                    print("Failed with \(error)")
                }
        }
            } else {
                
            }
        } else {
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
    }
    
    
}
