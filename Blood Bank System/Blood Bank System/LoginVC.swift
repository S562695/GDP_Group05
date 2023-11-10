//
//  LoginVC.swift
//  Blood Bank System
//
//  Created by Konanki,Naga Lakshmi on 10/20/23.
//

import UIKit
import Firebase
import Lottie
import AnimatedGradientView

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.applyAnimatedGradient()
                LogoAnimationView.animation = LottieAnimation.named("LoginImage")
                LogoAnimationView.loopMode = .loop
                LogoAnimationView.play(){
                    [weak self] _ in
                    self?.LogoAnimationView.isHidden = false
                }
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var LogoAnimationView: LottieAnimationView!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBAction func usernameTF(_ sender: UITextField) {
        
    }
    
    
    @IBAction func passwordTF(_ sender: UITextField) {
        
    }
    
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
                self.showAlert(title: "Success", message: "Login successful!")
                    self.performSegue(withIdentifier: "goToNext", sender: nil)
                
                //self.present(animated: true, completion: nil)
            }
        }
        
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.applyAnimatedGradient()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.subviews.first?.removeFromSuperview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.subviews.first?.frame = self.view.bounds
    }
    
    private func applyAnimatedGradient(){
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BCOE4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E6E68E"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "FF0000"], .left, .axial)]
        view.insertSubview(animatedGradient, at: 0)
    }
    

func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        switch identifier{
        case "goToNext":
            guard let homevc = segue.destination as? homeTVC else {return}
            
        default:
            break
        }
    }
    

    
    @IBAction func cancelClicked(_ sender: UIButton) {
        emailTF.text = ""
        passwordTF.text = ""
        loginBTN.isEnabled = false
        resetBTN.isEnabled = false
        passwordTF.isEnabled = false
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
