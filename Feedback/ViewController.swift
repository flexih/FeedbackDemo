//
//  ViewController.swift
//  Feedback
//
//  Created by flexih on 2019/3/10.
//  Copyright © 2019 flexih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        button?.fb_on = true
    }

    @IBAction func buttonClicked(button: UIButton) {
        
    }
}

