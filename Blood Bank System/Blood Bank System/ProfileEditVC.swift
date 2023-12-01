//
//  ProfileEditVC.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 12/1/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class ProfileEditVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    class ProfileEditViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

        @IBOutlet weak var profileImageView: UIImageView!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var lastNameTextField: UITextField!

        override func viewDidLoad() {
            super.viewDidLoad()
            loadUserData()
        }

        // Load user data from Firebase and update UI
        private func loadUserData() {
            guard let currentUser = Auth.auth().currentUser else {
                // User not logged in
                return
            }

            // Update UI with user data
            emailTextField.text = currentUser.email
            firstNameTextField.text = currentUser.displayName?.components(separatedBy: " ").first
            lastNameTextField.text = currentUser.displayName?.components(separatedBy: " ").last

            // Load profile image if available
            // You can replace "profileImages" with your own storage path
            let storageRef = Storage.storage().reference().child("profileImages").child(currentUser.uid)
            storageRef.downloadURL { [weak self] (url, error) in
                if let url = url {
                    // Load profile image from URL
                    self?.profileImageView.load(url: url)
                }
            }
        }

        @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
            updateProfile()
        }

        @IBAction func changeProfilePictureTapped(_ sender: UITapGestureRecognizer) {
            showImagePicker()
        }

        private func showImagePicker() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }

        // MARK: - UIImagePickerControllerDelegate

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                profileImageView.image = editedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }

        // Update user profile information in Firebase
        private func updateProfile() {
            guard let currentUser = Auth.auth().currentUser else {
                // User not logged in
                return
            }

            // Update display name and email
            currentUser.updateEmail(to: emailTextField.text!) { [weak self] (error) in
                if let error = error {
                    print("Error updating email: \(error.localizedDescription)")
                } else {
                    let updatedDisplayName = "\(self?.firstNameTextField.text ?? "") \(self?.lastNameTextField.text ?? "")"
                    currentUser.updateProfile(displayName: updatedDisplayName) { (error) in
                        if let error = error {
                            print("Error updating display name: \(error.localizedDescription)")
                        } else {
                            // Update successful
                            self?.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }

            // Upload profile image if available
            if let imageData = profileImageView.image?.jpegData(compressionQuality: 0.5) {
                let storageRef = Storage.storage().reference().child("profileImages").child(currentUser.uid)
                storageRef.putData(imageData, metadata: nil) { (_, error) in
                    if let error = error {
                        print("Error uploading profile image: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    extension UIImageView {
        // Load image from URL asynchronously
        func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
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
