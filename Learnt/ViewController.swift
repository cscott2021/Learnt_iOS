//
//  ViewController.swift
//  Learnt
//
//  Created by Caleb Scott on 7/23/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Auth0
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("the testing")
        Auth0
            .webAuth()
            .scope("openid profile")
            .audience("https://learnt-app.auth0.com/userinfo")
            .start {
                switch $0 {
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                case .success(let credentials):
                    // Do something with credentials e.g.: save them.
                    // Auth0 will automatically dismiss the login page
                    print("Credentials: \(credentials)")
                }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

