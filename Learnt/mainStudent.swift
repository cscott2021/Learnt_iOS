//
//  mainStudent.swift
//  Learnt
//
//  Created by the user on 8/17/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//


import UIKit

import FirebaseUI
import Firebase
class mainStudent: UIViewController {
   
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
}
