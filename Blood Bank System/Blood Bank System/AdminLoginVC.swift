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
