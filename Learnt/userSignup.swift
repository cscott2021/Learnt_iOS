//
//  userSignup.swift
//  Learnt
//
//  Created by Caleb Scott on 7/24/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//
import UIKit
class userSignup: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirm: UITextField!

    @IBOutlet var signUpB: UIButton!
    @IBAction func signUp(){
        if email.text != "" && password.text != "" && confirm.text != "" {
            if password.text == confirm.text {
            }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
    }
    
    
}
