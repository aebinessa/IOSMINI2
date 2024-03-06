//
//  ViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Nawaf Almutairi on 05/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let depositButton = UIButton()
    let withdrawButton = UIButton()
    let imageProfile = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = " Main "
        
        view.addSubview(depositButton)
        view.addSubview(withdrawButton)
        view.addSubview(imageProfile)
        
        
    }
    
    func setUpUI(){
        
        depositButton.setTitle(" Deposit", for: .normal) //why normal ?
        depositButton.backgroundColor = .green
        depositButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        depositButton.layer.cornerRadius = 10
        depositButton.layer.borderColor = UIColor.black.cgColor
        depositButton.tintColor = .white
        depositButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        depositButton.backgroundColor = .lightGray
        
        
        withdrawButton.setTitle(" Withdarw", for: .normal) //why normal ?
        withdrawButton.backgroundColor = .red
        withdrawButton.setTitleColor(UIColor.lightGray, for: .normal)
        withdrawButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        withdrawButton.layer.cornerRadius = 10
        withdrawButton.layer.borderColor = UIColor.black.cgColor
        withdrawButton.tintColor = .darkGray
        withdrawButton.layer.borderWidth = 2
        withdrawButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
        withdrawButton.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }


}

