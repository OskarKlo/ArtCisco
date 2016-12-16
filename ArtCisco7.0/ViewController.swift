//
//  ViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/14/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPasswordSegue", sender: self)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        self.performSegue(withIdentifier: "homePageSegue", sender: self)
    }

    @IBAction func signUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "newAccountSegue", sender: self)
    }

}

