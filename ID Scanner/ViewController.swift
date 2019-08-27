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
        NotificationCenter.default.addObserver(self, selector: #selector(updateNameLabel), name: NSNotification.Name("updateNameLabel"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateProfilePic), name: NSNotification.Name("setProfileImage"), object: nil)
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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @objc func updateNameLabel(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let fullName = dict["fullName"] as? String {
                //nameLabel.text = fullName
                nameLabel.text = "Welcome, " + fullName + "!"
            }
        }
    }
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @objc func updateProfilePic(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let profilePicThing = dict["profilePic"] as? UIImage {
                profilePic.image = profilePicThing
            }
        }
    }
    
    @IBAction func logOut(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        performSegue(withIdentifier: "backToStart", sender: self)
        
    }
    
}

