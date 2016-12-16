//
//  PopularViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/15/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import Foundation

import UIKit

class PopularViewController: UIViewController {
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var homeTabButton: UIBarButtonItem!
    @IBOutlet weak var popularTabButton: UIBarButtonItem!
    @IBOutlet weak var mapTabButton: UIBarButtonItem!
    @IBOutlet weak var categoryTabButton: UIBarButtonItem!
    @IBOutlet weak var profileTabButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func homeTabButton(_ sender: Any) {
        self.performSegue(withIdentifier: "popularToHomeSegue", sender: self)
    }
}
