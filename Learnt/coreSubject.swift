//
//  coreSubject.swift
//  Learnt
//
//  Created by Caleb Scott on 8/15/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit

import FirebaseUI
import Firebase
class coreSubject: UIViewController {
    @IBAction func science(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func english(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func math(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func socialStudies(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func fl(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func cs(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func fineArts(){
        tutorOpen().newSession(user: user_id)
    }
    @IBAction func health(){
        tutorOpen().newSession(user: user_id)
    }
    
    func completeSession(){
        channel_id = user_id
        let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "whiteboard") as UIViewController
        
        navigationItem.backBarButtonItem?.tintColor = .white
        
        self.navigationController?.pushViewController(ViewControllernew1, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
