//
//  LoginVC.swift
//  Blood Bank System
//
//  Created by Konanki,Naga Lakshmi on 10/20/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty,
        let password = passwordTF.text, !password.isEmpty else {
            // Display an error message if fields are empty
            showAlert(title: "Error", message: "Please enter both email and password.")
            return
        }
        
        // Create a new user account with Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // An error occurred during registration
                self.showAlert(title: "Error", message: "Please continue to Register an Account")
            } else {
                // Registration successful
                self.showAlert(title: "Success", message: "Registration successful!")
            }
        }
}

func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
}
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        emailTF.text = ""
        passwordTF.text = ""
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
