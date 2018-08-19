//
//  tutorOpen.swift
//  Learnt
//
//  Created by Caleb Scott on 8/3/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Firebase
public class tutorOpen {
     var tutor_ref: DatabaseReference = Database.database().reference(withPath: "need_tutor")
    func newSession(user: String){
        let ref = tutor_ref.child(user)
        
        let message = ["user_id": user, "name": "This is the name", "subject": "subject", "status": "open"]
        ref.setValue(message)
        
    }

    
    
}
