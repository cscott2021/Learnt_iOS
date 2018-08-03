//
//  tutorOpen.swift
//  Learnt
//
//  Created by Caleb Scott on 8/3/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit

class tutorOpen {
import Firebase
public class tutorOpen: UIViewController {
     var tutor_ref: DatabaseReference = Database.database().reference(withPath: "open_tutors")
    func startQuery() {
        let query = Database.database().reference().child("open_tutors").queryLimited(toLast: 10)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in

            if  let data        = snapshot.value as? [String: String],
                let id          = data["user_id"],
                let name        = data["name"],
                let subject        = data["subject"]
            {
                print(data)
                channel_id = id
                
            }
        })
    }
    
    
    
}
