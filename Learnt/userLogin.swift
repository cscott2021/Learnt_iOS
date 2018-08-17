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
var user_id: String!
class userLogin: UIViewController {

@IBOutlet weak var  img: UIImageView!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signIn: UIButton!
    @IBAction func login(){
        if email.text != "" && password.text != "" {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                print(String(describing: Auth.auth().currentUser!.uid))
                user_id = Auth.auth().currentUser!.uid
                let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tutor") as UIViewController
                
                self.navigationItem.backBarButtonItem?.tintColor = .white
                
                self.navigationController?.pushViewController(ViewControllernew1, animated: true)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
    }
    
    
}
