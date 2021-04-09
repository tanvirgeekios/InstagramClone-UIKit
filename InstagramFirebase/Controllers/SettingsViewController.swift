//
//  SettingsViewController.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 8/4/21.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logoutClicked(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "fromSettingsToLogin", sender: nil)
        }catch{
            print("Error Loging out")
        }
    }
}
