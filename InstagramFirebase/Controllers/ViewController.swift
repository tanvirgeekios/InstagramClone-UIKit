//
//  ViewController.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 29/3/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- Actions
    @IBAction func signInClicked(_ sender: UIButton) {
        signIn()
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        signUp()
    }
    //MARK:- functions
    func signIn(){
        let email = emailText.text?.trimmingCharacters(in: .whitespaces)
        let password = passwordText.text?.trimmingCharacters(in: .whitespaces)
        if email != "" &&  password != ""{
            Auth.auth().signIn(withEmail: email!, password: password!) { (authDatas, error) in
                if let error = error{
                    self.showAlert(title: "Error", message: error.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            showAlert(title: "Error", message: "Username and Password is required")
        }
    }
    
    func signUp(){
        let email = emailText.text?.trimmingCharacters(in: .whitespaces)
        let password = passwordText.text?.trimmingCharacters(in: .whitespaces)
        if email != "" &&  password != ""{
            Auth.auth().createUser(withEmail: email!, password: password!) { (authData, error) in
                if let error = error{
                    self.showAlert(title: "Error", message: error.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            emailText.text = ""
            passwordText.text = ""
            showAlert(title: "Error", message: "You must write email/password")
        }
    }
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

