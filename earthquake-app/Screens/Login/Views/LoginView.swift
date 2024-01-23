//
//  Loginself.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 10-01-24.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped()
    func registerButtonTapped()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nombre de usuario"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Contraseña"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iniciar Sesión", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registrarse", for: .normal)
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
extension LoginView {
    
    private func setupViews() {
        
        self.backgroundColor = .white
        
        self.addSubview(usernameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)

        setupConstraints()
    }
    
    private func setupConstraints() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Restricciones para el campo de nombre de usuario
            usernameTextField.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),

            // Restricciones para el campo de contraseña
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            // Restricciones para el botón de inicio de sesión
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func validateTexfield() -> Bool {
        if let text = usernameTextField.text,
            !text.isEmpty{
            return true
        }
        
        if let text = passwordTextField.text,
            !text.isEmpty{
            return true
        }
        
        return false
    }
    
    @objc
    private func didTapLoginButton() {
        if validateTexfield() {
            self.delegate?.loginButtonTapped()
            print("Validate true")
            return
        }
        print("Validate False")
    }
    
    @objc
    private func didTapRegisterButton() {
        self.delegate?.registerButtonTapped()
    }
    
}
