//
//  ProfileEditVC.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 12/1/23.
//

import UIKit


class ProfileEditVC: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var saveBTN: UIButton!
    
    @IBOutlet weak var errorLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBTNClicked(_ sender: UIButton) {
        if saveBTN.isEnabled == true {
            errorLBL.text = "Hurray! Changes are saved"
        } else {
            errorLBL.text = "Try to edit again!"
        }
    }
    
}
