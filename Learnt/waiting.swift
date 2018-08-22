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
        gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)

       
        
    }
}
