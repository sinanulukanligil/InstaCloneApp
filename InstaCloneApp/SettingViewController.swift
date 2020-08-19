//
//  SettingViewController.swift
//  InstaCloneApp
//
//  Created by Yusuf Sinan Ulukanligil on 2020-08-15.
//  Copyright © 2020 Yusuf Sinan Ulukanligil. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func settingLogOut(_ sender: Any) {
        do {
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toVC", sender: nil)
        } catch {
            print("error")
        }
    
}
}
