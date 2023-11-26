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
        LogoAnimationView.animation = LottieAnimation.named("adminImg")
                LogoAnimationView.loopMode = .loop
                LogoAnimationView.play(){
                    [weak self] _ in
                    self?.LogoAnimationView.isHidden = false
                }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var LogoAnimationView: LottieAnimationView!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBOutlet weak var errorLBL: UILabel!
    
    
    @IBAction func checkUsername(_ sender: UITextField) {
        
    }
    
    @IBAction func checkPassword(_ sender: UITextField) {
        
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        let enteredUsername = usernameTF.text ?? ""
                let enteredPassword = passwordTF.text ?? ""

                if enteredUsername == "admin" && enteredPassword == "password" {
                    // Successful login
                    print("Admin login successful!")
                    self.performSegue(withIdentifier: "homeSegue", sender: self)
                    // Perform the necessary actions after successful login, such as navigating to the admin dashboard.
                } else {
                    // Failed login
                    print("Invalid username or password. Please try again.")
                    // You might want to show an alert or update the UI to inform the user about the incorrect credentials.
                }
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        usernameTF.text = ""
        passwordTF.text = ""
        loginBTN.isEnabled = false
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
