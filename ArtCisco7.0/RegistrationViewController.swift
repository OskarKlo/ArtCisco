//
//  RegistrationViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/17/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import Foundation

import UIKit
import FirebaseAuth
import Firebase

class RegistrationViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //create user action
    @IBAction func signUpAction(_ sender: Any) {
        if passwordTextField.text == confirmPasswordTextField.text {
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                // create user, then perform segue
                self.performSegue(withIdentifier: "registerUserSegue", sender: self)
                
            }
        }
        else {
            //passwords do not match, display error to user
        }
    }
    
   
    
}
