//
//  ViewController.swift
//  ID Scanner
//
//  Created by Sean Jordan on 8/1/19.
//  Copyright © 2019 UMBC SGA. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(switchToSignInScreen), name: NSNotification.Name("signInToApp"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        print("Button pressed!")
        GIDSignIn.sharedInstance()?.signIn()
        performSegue(withIdentifier: "toSignedInScreen", sender: self)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("SEGUE ID: " + identifier)
        return false
    }
    
    @objc func switchToSignInScreen(_ sender: NSNotification) {
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let newViewController = storyBoard.instantiateViewController(withIdentifier: "signInScreen")
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name("showNameLabel"), object: nil, userInfo: sender.userInfo)
        //self.present(newViewController, animated: true, completion: nil)
    }
    
}

