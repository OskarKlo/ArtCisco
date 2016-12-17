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
import FBSDKLoginKit
import GoogleSignIn

class ViewController: UIViewController,FBSDKLoginButtonDelegate, GIDSignInDelegate, GIDSignInUIDelegate {

    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var loginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.center = self.view.center
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self;
        self.view.addSubview(loginButton)
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.cliendID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        self.performSegue(withIdentifier: "registrationSegue", sender: self)
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error) != nil {
            print(error.localizedDescription)
            return
        }
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if (error) != nil {
                print(error?.localizedDescription ?? <#default value#>)
                return
            }
            print("User Logged in w/Google")
        })
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if (error) != nil {
            print(error.localizedDescription)
            return
        }
            try! FIRAuth.auth()!.signOut()
    }
    
    func signInAction(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            // sign in
            self.performSegue(withIdentifier: "signInUserSegue", sender: self)
        }
    
        
    }
    

    
}

