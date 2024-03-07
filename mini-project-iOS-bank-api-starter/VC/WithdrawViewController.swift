//
//  WithdrawViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fatma Buyabes on 06/03/2024.
//

import UIKit
import Eureka
class WithdrawViewController: FormViewController {
    
    var token : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm()
        
        // Do any additional setup after loading the view.
    }
    func setupForm(){
        
        form +++ Section("")
        form +++ Section("")
        form +++ Section("")
        form +++ Section("")
        form +++ Section("")
        
        form +++ Section("Withdraw")
        <<< DecimalRow() { row in
            row.title = "Balance"
            row.placeholder = "Enter the amount"
            row.tag = "Balance"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
                
            }
        }
        
        <<< ButtonRow() { row in
            row.title = "Withdraw"
        }.onCellSelection {_ , _ in
            self.withdrawAction()
        }
        
    }
    
    @objc func withdrawAction() {
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "🚨", message: "Please fill in all required fields.")
            return
        }
        
        guard //let token = token, // Ensure token is available
            let amountRow = form.rowBy(tag: "Balance") as? DecimalRow, // Extract amount row
            let amount = amountRow.value
                
        else {
            print("Token or amount not available.")
            
            return
        }
        
        let amountChange = AmountChange(amount: amount) // Create an AmountChange object
        //                print("Token: \(token)")
        //                print("AmountChange: \(amountChange)")
        NetworkManager.shared.deposit(token: token ?? "", amountChange: amountChange) { result in
            print(self.token)
            print(amountChange)
            
            if self.token == nil{
                print("token not found ")
            } else{
                switch result {
                case .success:
                    // Handle success, maybe update UI or show a success message
                    print("Withdraw successful")
                case .failure(let error):
                    // Handle failure, maybe show an error message
                    print("Withdraw failed with error: \(error)")
                }
                
            }
            
        }
        
    }
    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
