//
//  LoginVC.swift
//  Chat App
//
//  Created by Abdulkarim Alansari on 06/02/1443 AH.
//

import UIKit

class LoginVC: UIViewController {

    // Add Scrollview in Login Screen
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    // Add Image in Login Screen
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Add Email Field in Login Screen
    private let emailField: UITextField = {
        let Email = UITextField()
        Email.autocapitalizationType = .none
        Email.autocorrectionType = .no
        Email.returnKeyType = .continue
        Email.layer.cornerRadius = 8
        Email.layer.borderWidth = 1
        Email.layer.borderColor = UIColor.lightGray.cgColor
        Email.placeholder = "Enter your email"
        Email.textAlignment = .center
        Email.keyboardType = .emailAddress
        Email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Email.leftViewMode = .always
        Email.backgroundColor = .white
        return Email
    }()
    
    // Add Password Field in Login Screen
    private let passwordField: UITextField = {
        let Password = UITextField()
        Password.autocapitalizationType = .none
        Password.autocorrectionType = .no
        Password.returnKeyType = .done
        Password.layer.cornerRadius = 8
        Password.layer.borderWidth = 1
        Password.layer.borderColor = UIColor.lightGray.cgColor
        Password.placeholder = "Enter your password"
        Password.textAlignment = .center
        Password.isSecureTextEntry = true
        Password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Password.leftViewMode = .always
        Password.backgroundColor = .white
        return Password
    }()
    
    // Add Button in Login Screen
    private let btnLogin : UIButton = {
        let Login = UIButton()
        Login.setTitle("Log in", for: .normal)
        Login.setTitleColor(.white, for: .normal)
        Login.backgroundColor = .link
        Login.layer.cornerRadius = 8
        Login.layer.masksToBounds = true
        Login.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return Login
    }()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // Add button in Right Bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))

        // Activite Login button
        btnLogin.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        
        emailField.delegate = self
        passwordField.delegate = self
        
        
        // Add SubView to be display in Screen
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(btnLogin)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2, y: 20, width: size, height: size)
        emailField.frame = CGRect(x: 30, y: imageView.buttom + 30, width: scrollView.width-60, height: 40)
        passwordField.frame = CGRect(x: 30, y: emailField.buttom + 10, width: scrollView.width-60, height: 40)
        btnLogin.frame = CGRect(x: 30, y: passwordField.buttom + 10, width: scrollView.width-60, height: 40)

    }
    
    //--------------------------- check if Email and Password is not Empty (func) --------------------------- //
    @objc private func loginButtonTapped(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                alertUserLoginError()
            return
        }
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Error", message: "Please enter email and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    

    //--------------------------- if user tapped Regiser (func) --------------------------- //

    @objc private func didTapRegister(){
        let vc = RegisterVC()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else  if textField == passwordField {
                loginButtonTapped()
        }
        return true
    }
}
