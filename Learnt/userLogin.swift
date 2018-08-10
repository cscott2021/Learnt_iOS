//
//  userLogin.swift
//  Learnt
//
//  Created by Caleb Scott on 7/24/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
class userLogin: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signIn: UIButton!
    @IBAction func login(){
        if email.text != "" && password.text != "" {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                print(String(describing: user))
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
    }
    
    
}
