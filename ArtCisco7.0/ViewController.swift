//
//  ViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/14/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "registrationSegue", sender: self)
    }

}

