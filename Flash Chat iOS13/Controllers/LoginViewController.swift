//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                
                //if there is a error
                if let e = error {
                    
                    //create alert
                    let alert = UIAlertController(title: "Error with registration", message: e.localizedDescription, preferredStyle: .alert)
                    
                    //add an action(button)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    //show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    //Navigate to chat view controller
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
    }
    
}
