//
//  pending.swift
//  Learnt
//
//  Created by Caleb Scott on 8/17/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
class pending: UIViewController {
    @IBOutlet var profileView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView.layer.cornerRadius = profileView.frame.width / 2
        profileView.clipsToBounds = true
        
        
    }
    
    
}
