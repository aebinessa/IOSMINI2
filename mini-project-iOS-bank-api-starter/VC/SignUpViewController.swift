//
//  SignUpViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fatma Buyabes on 06/03/2024.
//

import UIKit
import Eureka

class SignUpViewController: FormViewController {
    
    var users: [User] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            setupForm()
            

        }



        func setupForm(){

            form +++ Section("")
            form +++ Section("")
            form +++ Section("Sign Up")
            <<< TextRow() { row in
                row.title = "Username"
                row.placeholder = "Enter username"
                row.tag = tag.username.rawValue
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange

                row.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }

                }
            }

            <<< TextRow() { row in
                row.title = "Email"
                row.placeholder = "Enter your email"
                row.tag = tag.email.rawValue
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange

                row.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }

                }
            }
            <<< PasswordRow() { row in
                row.title = "Password"
                row.placeholder = "Enter a password"
                row.tag = tag.password.rawValue
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange

                row.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }

                }
            }

            form +++ Section("")
            form +++ Section("")
            <<< ButtonRow(){ row in
                row.title = "Sign Up"


                row.onCellSelection{ cell, row in
                    print("Button Cell Tapped")
                    self.SignUpAction()

                }
            }
        }
    
    @objc func SignUpAction(){

            let errors = form.validate()

            guard errors.isEmpty else {
                print(errors)
                print("SOMETHING IS MISSING 🚨")

                presentAlertWithTitle(title: "🚨", message: "fill the empty textfields ")
                return
            }


        let passwordRow: PasswordRow? = form.rowBy(tag: tag.password.rawValue)  //make enum for tags
        let emailRow: TextRow? = form.rowBy(tag: tag.email.rawValue)  //make enum for tags
        let usernameRow: TextRow? = form.rowBy(tag: tag.username.rawValue)  //make enum for tags



            // Converting data to String,Int, and etc
            let password = passwordRow?.value ?? ""
            let email = emailRow?.value ?? ""
            let username = usernameRow?.value ?? ""

            let user = User(username: username, email: email, password: password)

            NetworkManager.shared.signup(user: user) { result in
                switch result{
                case .success(let TokenResponse):
                    print(TokenResponse.token)
                    print("Signup successful.")

                case .failure(let error):
                    print("Signup failed.")
                    print(error)
                }

          }

        }
        private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    
        

    
    enum tag: String{
        case username
        case password
        case email
    }

}
