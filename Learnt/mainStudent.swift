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
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.cornerRadius = 3
        shadowView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 7, height: 7)
        shadowView.layer.shadowRadius = 1.5
        shadowView.layer.shadowOpacity = 0.08
         
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
}
