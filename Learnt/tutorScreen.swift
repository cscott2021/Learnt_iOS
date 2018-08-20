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
    @IBOutlet weak var img: UIImageView!
    func openTutor() {
        let query = Database.database().reference().child("need_tutor").queryLimited(toLast: 10)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            
            if  let data        = snapshot.value as? [String: String],
                let id          = data["user_id"],
                let name        = data["name"],
                let subject        = data["subject"],
                let status       = data["status"]
            {
                print(data)
                
                if subject == "subject" && status == "open" {
                    channel_id = id
                    let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pending") as UIViewController
                    
                    
                    self?.navigationController?.pushViewController(ViewControllernew1, animated: true)
                }
                
            }
        })
    }

    
    override func viewDidLoad() {
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        super.viewDidLoad()
        openTutor()

}
}
