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
    let image = UIImageView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Welcome "
        
        super.viewDidLoad()
        image.image = UIImage(named: "kfh1")
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        view.addSubview(image)
        setUpUI()
        setUpLayout()
        setupNavigationBar()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    

        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        
        image.contentMode = .scaleAspectFit
        
        loginButton.setTitle(" Login", for: .normal) //why normal ?
        //loginButton.backgroundColor = .black
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.tintColor = .white
        loginButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.02355217002, green: 0.5414767265, blue: 0.2449679375, alpha: 1)
        
        
        
        signupButton.setTitle(" Sign Up", for: .normal) //why normal ?
        signupButton.backgroundColor = .white
        signupButton.setTitleColor(UIColor.darkGray, for: .normal)
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        signupButton.layer.cornerRadius = 10
        signupButton.tintColor = .darkGray
        signupButton.layer.borderWidth = 2
        signupButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        signupButton.layer.borderColor = #colorLiteral(red: 0.02355217002, green: 0.5414767265, blue: 0.2449679375, alpha: 1)
        
        
    }
    
    
    func setUpLayout(){
        
        image.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-250)
            
            
        }
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // Center horizontally
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.centerY.equalTo(loginButton.snp.bottom).offset(40)
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
        let loginVC = ViewController() /// will change it later
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

