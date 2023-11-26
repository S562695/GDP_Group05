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
        setupDatePicker()
        self.applyAnimatedGradient()
        LogoAnimationView.animation = LottieAnimation.named("registerImg")
                LogoAnimationView.loopMode = .loop
                LogoAnimationView.play(){
                    [weak self] _ in
                    self?.LogoAnimationView.isHidden = false
                }

        // Do any additional setup after loading the view.
    }
    
    private func setupDatePicker() {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            DOBField.inputView = datePicker

            datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        }

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        DOBField.text = dateFormatter.string(from: sender.date)
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
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBOutlet weak var signUpBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBOutlet weak var errorLBL: UILabel!
   
    @IBAction func signUpClicked(_ sender: UIButton) {
        signUp()
    }
    
    private func signUp() {
            guard let firstName = firstNameTF.text,
                  let lastName = lastNameTF.text,
                  let dob = DOBField.text,
                  let email = emailTF.text,
                  let password = passwordTF.text,
                  let confirmPassword = confirmPasswordTF.text
            else {
                return
            }

            // Check if passwords match
            guard password == confirmPassword else {
                showError(message: "Passwords do not match")
                return
            }

            // Additional validations can be added as needed

            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error {
                    self?.showError(message: error.localizedDescription)
                } else {
                    self?.performSegue(withIdentifier: "homeSegue", sender: self)
                }
            }
        }

        private func showError(message: String) {
            errorLBL.text = message
            errorLBL.isHidden = false
        }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        firstNameTF.text = ""
        lastNameTF.text = ""
        DOBField.text = ""
        emailTF.text = ""
        passwordTF.text = ""
        confirmPasswordTF.text = ""
        errorLBL.text = ""
        errorLBL.isHidden = true
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
