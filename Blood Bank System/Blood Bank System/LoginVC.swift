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
    private var isNotARobotVerified = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //robotCheckbox.backgroundColor = UIColor.gray
        //robotCheckbox.layer.cornerRadius = 5
        //robotCheckbox.layer.borderWidth = 1
        //robotCheckbox.backgroundColor = UIColor.red
        //notARobotButton.addTarget(self, action: #selector(notARobotButtonTapped), for: .touchUpInside)
                self.applyAnimatedGradient()
                LogoAnimationView.animation = LottieAnimation.named("LoginImage")
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
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var robotCheckbox: UISwitch!
    
    
    @IBOutlet weak var notARobotButton: UIButton!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBOutlet weak var errorLBL: UILabel!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        if robotCheckbox.isOn {
                    login()
                } else {
                    showError(message: "Please verify that you are not a robot.")
                }
    }
    
    private func login() {
            guard let email = emailTF.text,
                  let password = passwordTF.text
            else {
                return
            }

            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error {
                    self?.showError(message: error.localizedDescription)
                } else {
                    // User successfully logged in
                    // You can navigate to another screen or perform additional actions
                    self?.performSegue(withIdentifier: "homeSegue", sender: self)
                }
            }
        }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        emailTF.text = ""
        passwordTF.text = ""
        errorLBL.text = ""
        errorLBL.isHidden = true
        isNotARobotVerified = false
      
    }
    
    @IBAction func notARobotButtonTapped(_ sender: UIButton) {
        robotCheckbox.isOn = true
    }
    
   private func showError(message: String) {
            errorLBL.text = message
            errorLBL.isHidden = false
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
