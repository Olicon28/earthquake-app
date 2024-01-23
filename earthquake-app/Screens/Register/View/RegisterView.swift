//
//  RegisterView.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 10-01-24.
//

import Foundation
import UIKit

protocol RegisterViewDelegate: AnyObject{
    func registerButtonTapped()
}

class RegisterView: UIView {
    
    weak var delegate: RegisterViewDelegate?
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nombre"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let lastnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Apellido"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registrar", for: .normal)
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RegisterView {
    
    private func validateTexfield() -> Bool {
        if let text = emailTextField.text,
            !text.isEmpty{
            return true
        }
        
        if let text = nameTextField.text,
            !text.isEmpty{
            return true
        }
        
        if let text = lastnameTextField.text,
            !text.isEmpty{
            return true
        }
        
        if let text = passwordTextField.text,
            !text.isEmpty{
            return true
        }
        
        return false
    }
    
    private func setupViews() {
        
        self.backgroundColor = .white
        self.addSubview(stackView)
        self.addSubview(registerButton)
        
        self.stackView.addArrangedSubview(emailTextField)
        self.stackView.addArrangedSubview(nameTextField)
        self.stackView.addArrangedSubview(lastnameTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        

        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastnameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //self.stackView.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor),
            self.stackView.heightAnchor.constraint(equalToConstant: 300),
            
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            self.lastnameTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func didTapRegisterButton() {
        if validateTexfield() {
            self.delegate?.registerButtonTapped()
            print("Validate true")
            return
        }
        print("Validate False")
    }
}
