//
//  RegistrationVC.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi Konanki on 10/20/23.
//

import UIKit
import Firebase
import Lottie
import AnimatedGradientView

class RegistrationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyAnimatedGradient()
        LogoAnimationView.animation = LottieAnimation.named("registerImg")
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
    
    @IBOutlet weak var fullNameTF: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBAction func signupClicked(_ sender: UIButton) {
        // Check if the email and password fields are not empty
            guard let email = emailTF.text, !email.isEmpty,
            let password = passwordTF.text, !password.isEmpty else {
                // Display an error message if fields are empty
                showAlert(title: "Error", message: "Please enter both email and password.")
                return
            }
            
            // Create a new user account with Firebase Authentication
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    // An error occurred during registration
                    self.showAlert(title: "Error", message: error.localizedDescription)
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
    
    @IBAction func resetClicked(_ sender: UIButton) {
        emailTF.text = ""
        passwordTF.text = ""
        signUpBtn.isEnabled = false
        resetBTN.isEnabled = false
        passwordTF.isEnabled = false
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
