//
//  AdminLoginVCViewController.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi Konanki on 11/10/23.
//

import UIKit
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
