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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius = profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        
        
    }
    
    
}
