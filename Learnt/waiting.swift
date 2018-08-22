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
    func runTimedCode(){
        let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "whiteboard") as UIViewController
        
        
        self?.navigationController?.pushViewController(ViewControllernew1, animated: true)
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        wait = true
        let query = Database.database().reference().child("need_tutor").child(user_id).child("status").queryLimited(toLast: 10)
        
        _ = query.observe(.childChanged, with: { [weak self] snapshot in
            
            if  let data        = snapshot.value as? [String: String],
                let status          = data["status"]
            {
                print(data)
                
                if status == "closed" && wait == true {
                    wait = false
                    let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "whiteboard") as UIViewController
                    
                    
                    self?.navigationController?.pushViewController(ViewControllernew1, animated: true)
                }
                
            }
        })
=======
        gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)

       
>>>>>>> c61d44f2710be97b96f6f2368109c295cbdf9262
        
    }
}
