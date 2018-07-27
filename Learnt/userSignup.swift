//
//  userSignup.swift
//  Learnt
//
//  Created by Caleb Scott on 7/24/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//
import UIKit

import FirebaseUI
import Firebase
class userSignup: UIViewController, FUIAuthDelegate {
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
        FirebaseApp.configure()
        let authUI = FUIAuth.defaultAuthUI()
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIFacebookAuth(),
            FUITwitterAuth(),
            FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
            ]
        authUI?.providers = providers

        let authViewController = authUI!.authViewController()

    }
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
    }
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
}
