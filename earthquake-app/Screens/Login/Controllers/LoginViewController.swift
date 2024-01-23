//
//  LoginViewController.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 10-01-24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginButtonTapped() {
        let homeViewController: HomeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func registerButtonTapped() {
        
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
        print("Tap in Register")
    }
}
