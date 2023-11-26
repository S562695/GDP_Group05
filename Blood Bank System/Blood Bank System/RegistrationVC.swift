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
    
    private func applyAnimatedGradient(){
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BCOE4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E6E68E"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "FF0000"], .left, .axial)]
        view.insertSubview(animatedGradient, at: 0)
    }
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var DOBField: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet weak var signUpBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBOutlet weak var errorLBL: UILabel!
   
    @IBAction func signUpClicked(_ sender: UIButton) {
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
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
