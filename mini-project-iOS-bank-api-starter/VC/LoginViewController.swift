//
//  LoginViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Abdullah Bin Essa on 3/6/24.
//

import UIKit
import Eureka

class LoginViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupEureka()
    }
    
    func setupEureka(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(submitTapped))
        
        form +++ Section("Login")
        <<< TextRow(){
            $0.title = "Username"
            $0.placeholder = "Enter username"
            $0.add(rule: RuleRequired())
            $0.validationOptions = .validatesOnChange
            $0.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    
                    
                }
            }
        }
        <<< TextRow(){
            $0.title = "Password"
            $0.placeholder = "Enter  password"
            $0.add(rule: RuleRequired())
            $0.validationOptions = .validatesOnChange
            $0.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    
                    
                }
            }
        }
        
        
    }
    @objc func submitTapped() {
        let errors = form.validate()
        
        guard errors.isEmpty else{
            print(errors)
            presentAlertWithTitle(title: "🚫", message: "no submission for username or password")
            return
        }
        
        
    }
    
    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    func setupNavigation(){
        let appearance = UINavigationBarAppearance()
        title = "Login Page"
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
