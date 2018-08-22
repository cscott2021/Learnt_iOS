//
//  waiting.swift
//  Learnt
//
//  Created by Caleb Scott on 8/22/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit

import FirebaseUI
import Firebase
var wait: Bool!
class waiting: UIViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wait = true
        let query = Database.database().reference().child("need_tutor").child(user_id).queryLimited(toLast: 10)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            
            if  let data        = snapshot.value as? [String: String],
                let id          = data["user_id"],
                let name        = data["name"],
                let subject        = data["subject"],
                let status       = data["status"]
            {
                print(data)
                
                if subject == "subject" && status == "closed" && wait == true {
                    wait = false
                    let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "whiteboard") as UIViewController
                    
                    
                    self?.navigationController?.pushViewController(ViewControllernew1, animated: true)
                }
                
            }
        })
        
    }
}
