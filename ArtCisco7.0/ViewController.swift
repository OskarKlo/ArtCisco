//
//  ViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/14/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "registrationSegue", sender: self)
    }
    
    
    @IBAction func signInAction(_ sender: Any) {
        FIRApp.configure()
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            // sign in
            self.performSegue(withIdentifier: "signInUserSegue", sender: self)
        }
    }
}

