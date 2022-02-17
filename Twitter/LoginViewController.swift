//
//  LoginViewController.swift
//  Twitter
//
//  Created by Juan Jose Gomez Medina on 2/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") == true {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            UserDefaults.standard.set(true, forKey: "UserLoggedIn")
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login");
        })
    }
    
}

