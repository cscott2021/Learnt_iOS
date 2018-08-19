//
//  acceptView.swift
//  Learnt
//
//  Created by Caleb Scott on 8/17/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI


class acceptView: UIViewController {
    
    @IBOutlet var profileImg: UIImageView!
    @IBAction func accept(){
        
        let ViewControllernew1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "whiteboard") as UIViewController
        
        
        self.navigationController?.pushViewController(ViewControllernew1, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius = profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        
        
    }
    
    
}
