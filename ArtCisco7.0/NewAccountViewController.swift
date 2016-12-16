//
//  NewAccountViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/15/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import Foundation

import UIKit

class NewAccountViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func createAccountButton(_ sender: Any) {
        self.performSegue(withIdentifier: "newAccountSegue", sender: self)
    }
}
