//
//  scheduleVC.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 12/1/23.
//

import UIKit

class scheduleVC: UIViewController {
    
    private let datePicker = UIDatePicker()
    private let timePicker = UIDatePicker()
    private let bloodGroupPicker = UIPickerView()
    
    let bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        setupTimePicker()
        setupBloodGroupPicker()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var bloodGroupTextField: UITextField!
    
    @IBOutlet weak var scheduleBTN: UIButton!
    
    @IBAction func scheduleClicked(_ sender: UIButton) {
        errorLBL.text = "Your appointment is Scheduled"
    }
    
    @IBOutlet weak var errorLBL: UILabel!
    
    private func setupDatePicker() {
            datePicker.datePickerMode = .date
            dateTextField.inputView = datePicker

            let toolbar = UIToolbar()
            toolbar.sizeToFit()

            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePickerDoneButtonTapped))
            toolbar.setItems([doneButton], animated: true)

            dateTextField.inputAccessoryView = toolbar
        }

        // Set up the time picker
        private func setupTimePicker() {
            timePicker.datePickerMode = .time
            timeTextField.inputView = timePicker

            let toolbar = UIToolbar()
            toolbar.sizeToFit()

            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(timePickerDoneButtonTapped))
            toolbar.setItems([doneButton], animated: true)

            timeTextField.inputAccessoryView = toolbar
        }

        // Set up the blood group picker
        private func setupBloodGroupPicker() {
            bloodGroupPicker.delegate = self
            bloodGroupPicker.dataSource = self
            bloodGroupTextField.inputView = bloodGroupPicker

            let toolbar = UIToolbar()
            toolbar.sizeToFit()

            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(bloodGroupPickerDoneButtonTapped))
            toolbar.setItems([doneButton], animated: true)

            bloodGroupTextField.inputAccessoryView = toolbar
        }
    @objc private func datePickerDoneButtonTapped() {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            dateTextField.text = formatter.string(from: datePicker.date)
            dateTextField.resignFirstResponder()
        }

        @objc private func timePickerDoneButtonTapped() {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            timeTextField.text = formatter.string(from: timePicker.date)
            timeTextField.resignFirstResponder()
        }

        @objc private func bloodGroupPickerDoneButtonTapped() {
            bloodGroupTextField.resignFirstResponder()
        }
    }

    extension scheduleVC: UIPickerViewDelegate, UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return bloodGroups.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return bloodGroups[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            bloodGroupTextField.text = bloodGroups[row]
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


