//
//  RegisterVC.swift
//  Chat App
//
//  Created by Abdulkarim Alansari on 05/02/1443 AH.
//

import UIKit

class RegisterVC: UIViewController {

    // Add Scrollview in Register Screen
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    // Add Image in Register Screen
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Add First Name Field in Register Screen
    private let firstName: UITextField = {
        let Fname = UITextField()
        Fname.autocapitalizationType = .none
        Fname.autocorrectionType = .no
        Fname.returnKeyType = .continue
        Fname.layer.cornerRadius = 8
        Fname.layer.borderWidth = 1
        Fname.layer.borderColor = UIColor.lightGray.cgColor
        Fname.placeholder = "Enter your First Name"
        Fname.textAlignment = .center
        Fname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Fname.leftViewMode = .always
        Fname.backgroundColor = .white
        return Fname
    }()
    
    // Add Last Name in Register Screen
    private let lastname: UITextField = {
        let Lname = UITextField()
        Lname.autocapitalizationType = .none
        Lname.autocorrectionType = .no
        Lname.returnKeyType = .continue
        Lname.layer.cornerRadius = 8
        Lname.layer.borderWidth = 1
        Lname.layer.borderColor = UIColor.lightGray.cgColor
        Lname.placeholder = "Enter your Last Name"
        Lname.textAlignment = .center
        Lname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Lname.leftViewMode = .always
        Lname.backgroundColor = .white
        return Lname
    }()
    
    // Add Email Field in Register Screen
    private let emailField: UITextField = {
        let Email = UITextField()
        Email.autocapitalizationType = .none
        Email.autocorrectionType = .no
        Email.returnKeyType = .continue
        Email.layer.cornerRadius = 8
        Email.layer.borderWidth = 1
        Email.layer.borderColor = UIColor.lightGray.cgColor
        Email.placeholder = "Enter your Email"
        Email.textAlignment = .center
        Email.keyboardType = .emailAddress
        Email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Email.leftViewMode = .always
        Email.backgroundColor = .white
        return Email
    }()
    
    // Add Password Field in Register Screen
    private let passwordField: UITextField = {
        let Password = UITextField()
        Password.autocapitalizationType = .none
        Password.autocorrectionType = .no
        Password.returnKeyType = .done
        Password.layer.cornerRadius = 8
        Password.layer.borderWidth = 1
        Password.layer.borderColor = UIColor.lightGray.cgColor
        Password.placeholder = "Enter your Password"
        Password.textAlignment = .center
        Password.isSecureTextEntry = true
        Password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        Password.leftViewMode = .always
        Password.backgroundColor = .white
        return Password
    }()
    
    // Add Button in Register Screen
    private let btnRegister : UIButton = {
        let Register = UIButton()
        Register.setTitle("Register", for: .normal)
        Register.setTitleColor(.white, for: .normal)
        Register.backgroundColor = .link
        Register.layer.cornerRadius = 8
        Register.layer.masksToBounds = true
        Register.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return Register
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // Add button in Right Bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(didTapRegister))

        // Activite Register button
        btnRegister.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        emailField.delegate = self
        passwordField.delegate = self
        
        
        // Add SubView to be display in Screen
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstName)
        scrollView.addSubview(lastname)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(btnRegister)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        
        imageView.addGestureRecognizer(gesture)

    }
    // Add Picure to profile
    @objc private func didTapChangeProfilePic(){
        presentPhotoActionSheet()
    }

    
    
    // ----------------------------------------
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2, y: 20, width: size, height: size)
        firstName.frame = CGRect(x: 30, y: imageView.buttom + 30, width: scrollView.width-60, height: 40)
        lastname.frame = CGRect(x: 30, y: firstName.buttom + 10, width: scrollView.width-60, height: 40)
        emailField.frame = CGRect(x: 30, y: lastname.buttom + 10, width: scrollView.width-60, height: 40)
        passwordField.frame = CGRect(x: 30, y: emailField.buttom + 10, width: scrollView.width-60, height: 40)
        btnRegister.frame = CGRect(x: 30, y: passwordField.buttom + 10, width: scrollView.width-60, height: 40)

    }
    
    //--------------------------- check if Email and Password is not Empty (func) --------------------------- //
    @objc private func registerButtonTapped(){
        firstName.resignFirstResponder()
        lastname.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let FNAME = firstName.text, let LNAME = lastname.text, let EMAIL = emailField.text, let PASSWORD = passwordField.text,
              !FNAME.isEmpty, !LNAME.isEmpty, !EMAIL.isEmpty, !PASSWORD.isEmpty, PASSWORD.count >= 6 else {
                alertUserRegisterError()
            return
        }
    }
    
    func alertUserRegisterError() {
        let alert = UIAlertController(title: "Error", message: "Please enter all informaion to create new account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    

    //--------------------------- if user tapped Regiser (func) --------------------------- //

    @objc private func didTapRegister(){
        let vc = LoginVC()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstName {
            lastname.becomeFirstResponder()
        } else if textField == lastname {
            emailField.becomeFirstResponder()
        } else if textField == passwordField{
            registerButtonTapped()
        }
        return true
    }
}

extension RegisterVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picure",message: "How would you like to select the picure?",preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in self?.presentCamera() }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self] _ in self?.presentPhotoPicker() }))
        present(actionSheet, animated: true)
    }
   
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print(info)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    
    
}
