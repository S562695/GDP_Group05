//
//  SideMenuVC.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 12/1/23.
//

import UIKit

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let menuItems = ["Donor Username", "Schedule an Appointment", "My Profile", "Log Out"]
        
        private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.backgroundColor = .white
            return tableView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }

        // MARK: - Table View Delegate and DataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            cell.textLabel?.text = menuItems[indexPath.row]
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Handle menu item selection
        switch indexPath.row {
        case 0:
            // Donor Username
            showDonorUsername()
        case 1:
            self.performSegue(withIdentifier: "scheduleSegue" , sender: self)
            showScheduleAppointment()
        case 2:
            // My Profile
            showMyProfile()
        case 3:
            // Log Out
            logout()
        default:
            break
        }
    }

    // Implement the actions for each menu item

    private func showDonorUsername() {
        // Add your logic to display donor username
        print("Show Donor Username")
    }

    private func showScheduleAppointment() {
        // Add your logic to navigate to the schedule appointment screen
        print("Show Schedule Appointment")
    }

    private func showMyProfile() {
        // Add your logic to navigate to the my profile screen
        print("Show My Profile")
    }

    private func logout() {
        // Add your logic to handle logout
        print("Logout")
        // For example, you might want to present a login screen or perform other logout actions.
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
