//
//  ViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Nawaf Almutairi on 05/03/2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var token: String?
    var user: User?
    
    let depositButton = UIButton()
    let withdrawButton = UIButton()
    let image = UIImageView()
    
    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let balanceLabel = UILabel()
    
    
    override func viewDidLoad() {
        view.addSubview(depositButton)
        view.addSubview(withdrawButton)
        view.addSubview(image)
        view.addSubview(emailLabel)
        view.addSubview(usernameLabel)
        view.addSubview(balanceLabel)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = "Main "
        super.viewDidLoad()
        image.image = UIImage(named: "kfh1")
        
        setUpUI()
        fetchUserDetails(token: token ?? "")
        setUpLayout()
        setUpNavigationBar()
        nav()
        depositButton.addTarget(self, action: #selector(depositTapped), for: .touchUpInside)
        withdrawButton.addTarget(self, action: #selector(withdrawTapped), for: .touchUpInside)
        
    }
    
    func setUpUI(){
        
        image.contentMode = .scaleAspectFit
        
        depositButton.setTitle(" Deposit", for: .normal) //why normal ?
        depositButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        depositButton.layer.cornerRadius = 10
        depositButton.layer.borderColor = UIColor.black.cgColor
        depositButton.tintColor = .white
        depositButton.setImage(UIImage(systemName: "plus"), for: .normal)
        depositButton.backgroundColor = #colorLiteral(red: 0.02355217002, green: 0.5414767265, blue: 0.2449679375, alpha: 1)
        
        
        
        withdrawButton.setTitle(" Withdraw", for: .normal)
        withdrawButton.backgroundColor = .red
        withdrawButton.setTitleColor(UIColor.white, for: .normal)
        withdrawButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        withdrawButton.layer.cornerRadius = 10
        withdrawButton.tintColor = .white
        withdrawButton.setImage(UIImage(systemName: "minus"), for: .normal)
        
        
        
        
        
        
    }
    
    func setUpLayout(){
        
        image.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-250)
            
            
        }
        
        depositButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        withdrawButton.snp.makeConstraints { make in
            make.centerY.equalTo(depositButton.snp.centerY)
            make.leading.equalTo(depositButton.snp.trailing).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100) // Adjusted constraint
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10) // Adjusted constraint
            make.centerX.equalToSuperview()
        }
       
        
        balanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameLabel.snp.top).offset(20)
            
            
        }
        
        
    }
    
    func setUpNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func nav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(transactionTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = UIColor.red
        
    }
    
    @objc func transactionTapped(){
        let traVC = TransactionsTableViewController()
        traVC.token = token
        traVC.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(traVC, animated: true)
        
    }
    
    
    @objc func withdrawTapped(){
        let withdrawVC = WithdrawViewController()
        withdrawVC.token = token
        withdrawVC.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(withdrawVC, animated: true)
        
    }
    
    @objc func depositTapped(){
        let depositVC = DepositViewController()
        depositVC.token = token
        depositVC.modalPresentationStyle = .popover
        
        self.navigationController?.pushViewController(depositVC, animated: true)
        
        
    }
    
    func fetchUserDetails(token: String){
        NetworkManager.shared.fetchUserDetails(token: self.token!){
            result in
            switch result{
            case.success(let userDetails):
                let user = userDetails
                self.usernameLabel.text = "\(user.username)"
                self.emailLabel.text = "\(user.email)"
                self.balanceLabel.text = "\(user.balance)"
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}




