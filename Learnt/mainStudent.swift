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
        shadowView.layer.shadowColor = UIcolor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView.layer.shadowOFFset = CGSize(width: 0, height: 1.75)
        shadowView.layer.shadowRadius = 1.7
        shadowView.layer.shadowOpacity = 0.45
         
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
}
