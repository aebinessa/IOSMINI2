//
//  LoginViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Abdullah Bin Essa on 3/6/24.
//

import UIKit
import Eureka

class LoginViewController: FormViewController {
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupEureka()
    }
    
    func setupEureka(){
        
        
        
        form +++ Section("Login")
        <<< TextRow(){
            $0.title = "Username"
            $0.placeholder = "Enter username"
            $0.tag = tag.username.rawValue
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
            $0.tag = tag.password.rawValue
            $0.add(rule: RuleRequired())
            $0.validationOptions = .validatesOnChange
            $0.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    
                    
                }
            }
        }
        form +++ Section("")
        <<< ButtonRow(){
            $0.title = "Login"
            self.submitTapped()
        }
        
        
    }
    @objc func submitTapped() {
        let errors = form.validate()
        
        guard errors.isEmpty else{
            print(errors)
            presentAlertWithTitle(title: "🚫", message: "no submission for username or password")
            return
        }
        let usernameRow: TextRow? = form.rowBy(tag: tag.username.rawValue)
        let passwordRow: TextRow? = form.rowBy(tag: tag.password.rawValue)
        
        let password = passwordRow?.value ?? ""
        let username = usernameRow?.value ?? ""
        
        let user = User(username: username, email: nil, password: password)
        
        NetworkManager.shared.signin(user: user) { result in
            switch result{
            case .success(let TokenResponse):
                print(TokenResponse.token)
                print("Sign in successful")
            case .failure(let error):
                print("sign in failed")
                print(error)
            }
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
    
    enum tag: String{
        case username
        case password
    }
}
