//
//  WelcomeViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fatma Buyabes on 06/03/2024.
//

import UIKit
import SnapKit
class WelcomeViewController: UIViewController {
    
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Welcome "
        
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        setUpUI()
        setUpLayout()
        setupNavigationBar()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    

        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        
        loginButton.setTitle(" Login", for: .normal) //why normal ?
        loginButton.backgroundColor = .black
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.tintColor = .white
        loginButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        loginButton.backgroundColor = .lightGray
        
        
        signupButton.setTitle(" Sign Up", for: .normal) //why normal ?
        signupButton.backgroundColor = .white
        signupButton.setTitleColor(UIColor.lightGray, for: .normal)
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        signupButton.layer.cornerRadius = 10
        signupButton.layer.borderColor = UIColor.black.cgColor
        signupButton.tintColor = .darkGray
        signupButton.layer.borderWidth = 2
        signupButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
        signupButton.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    
    func setUpLayout(){
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // Center horizontally
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(loginButton.snp.bottom).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    
    func setUpNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(navIns)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
    }

    @objc func loginTapped(){
        let loginVC = LoginViewController() /// will change it later
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    
    @objc func signupTapped(){
        let signupVC = SignUpViewController() /// will change it later
        self.navigationController?.pushViewController(signupVC, animated: true)
        
    }
    
    @objc func navIns(){
        let insVC = ViewController()
        insVC.modalPresentationStyle = .popover
        self.present(insVC, animated: true)
        
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

