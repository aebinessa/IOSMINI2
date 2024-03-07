//
//  TransactionTableTableViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fatma Buyabes on 06/03/2024.
//
//
import UIKit
import Alamofire

class TransactionsTableViewController: UITableViewController {
    var token : String?
    
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchTransaction()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        
        let transaction = transactions[indexPath.row]
        print(transaction)
        cell.textLabel?.text = "\(transaction.type)"
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.numberOfLines = 6
        cell.detailTextLabel?.text = "\(transaction.amount)"
        
        if transaction.type == "deposit" {
                cell.detailTextLabel?.text = "+ \(transaction.amount)"
        } else {
                cell.detailTextLabel?.text = "- \(transaction.amount)"
        }
        
        // for the name
        if transaction.type == "deposit" {
            cell.textLabel?.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0, blue: 0.03613648936, alpha: 1)
        }
        

        return cell
    }
    
    
    
    
    func fetchTransaction() {
            guard let token = token else {
                print("Token is missing")
                return
            }

            NetworkManager.shared.getTransactions(token: token) { result in
                switch result {
                case .success(let transactions):
                    self.transactions = transactions
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Failed to fetch transactions: \(error)")

                }
            }
        }

}
