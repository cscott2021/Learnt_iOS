//
//  tutorScreen.swift
//  Learnt
//
//  Created by Caleb Scott on 8/15/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit

import FirebaseUI
import Firebase
class tutorScreen: UIViewController {
    func openTutor() {
        let query = Database.database().reference().child("need_tutor").queryLimited(toLast: 10)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            
            if  let data        = snapshot.value as? [String: String],
                let id          = data["user_id"],
                let name        = data["name"],
                let subject        = data["subject"]
            {
                
                if subject == "subject" {
                    print(data)
                    channel_id = id
                }
                
            }
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
}
