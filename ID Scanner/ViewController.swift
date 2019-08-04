//
//  ViewController.swift
//  ID Scanner
//
//  Created by Sean Jordan on 8/1/19.
//  Copyright © 2019 UMBC SGA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(displayP3Red: 0.9804, green: 0.7569, blue: 0.0, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        print("Button pressed!")
    }
}

