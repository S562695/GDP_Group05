//
//  AdminLoginVCViewController.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi Konanki on 11/10/23.
//

import UIKit
import Firebase
import Lottie
import AnimatedGradientView

class AdminLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.applyAnimatedGradient()
        LogoAnimationView.animation = LottieAnimation.named("adminImg")
                LogoAnimationView.loopMode = .loop
                LogoAnimationView.play(){
                    [weak self] _ in
                    self?.LogoAnimationView.isHidden = false
                }
        // Do any additional setup after loading the view.
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
    
    @IBOutlet weak var LogoAnimationView: LottieAnimationView!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = usernameTF.text, !email.isEmpty,
        let password = passwordTF.text, !password.isEmpty else {
            // Display an error message if fields are empty
            showAlert(title: "Error", message: "Please enter both email and password.")
            return
        }
        
        // Create a new user account with Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResult, error) in
             if usernameTF.text == "admin@gmail.com" && self.passwordTF.text == "lakshmi" {
                self.showAlert(title: "Successful", message: "Admin Login Successful")
                
            }
        }
        
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        usernameTF.text = ""
        passwordTF.text = ""
        loginBTN.isEnabled = false
        resetBTN.isEnabled = false
        passwordTF.isEnabled = false
    }
    
    @IBAction func checkUsername(_ sender: UITextField) {
        
    }
    
    @IBAction func checkPassword(_ sender: UITextField) {
        
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.usernameTF.text = ""
            self.passwordTF.text = ""
            
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
        
        
        
        
        
        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let identifier = segue.identifier
            switch identifier{
            case "goToNext":
                guard let productvc = segue.destination as? homeTVC else {return}
                //productvc.navigationItem.title = "Products"
            default:
                break
            }
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
