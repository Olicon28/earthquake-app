//
//  RegisterViewController.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 10-01-24.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerView
    }
}

extension RegisterViewController: RegisterViewDelegate {
    
    func registerButtonTapped() {
        let login = LoginViewController()
        navigationController?.pushViewController( login, animated: true)
    }
}
