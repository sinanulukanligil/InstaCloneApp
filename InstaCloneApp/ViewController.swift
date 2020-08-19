//
//  ViewController.swift
//  InstaCloneApp
//
//  Created by Yusuf Sinan Ulukanligil on 2020-08-15.
//  Copyright © 2020 Yusuf Sinan Ulukanligil. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet var viewImage: UIImageView!
    @IBOutlet var viewEmailText: UITextField!
    @IBOutlet var viewPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func viewSignIn(_ sender: Any) {
        if viewEmailText.text != "" && viewPasswordText.text != "" { Auth.auth().signIn(withEmail: viewEmailText.text!, password: viewPasswordText.text!) { (AuthData, error) in
            if error != nil {
                self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
            } else {
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
        }
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "The Email and Password is Required!")
        }
        
    }
    @IBAction func viewRegister(_ sender: Any) {
        if viewEmailText.text != "" && viewPasswordText.text != "" {
            Auth.auth().createUser(withEmail: viewEmailText.text!, password: viewPasswordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "Email and Password is required!")
        }
    }
    func makeAlert(titleInput:String,messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }
}

