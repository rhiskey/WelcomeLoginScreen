//
//  ViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 23.03.2022.
//

import UIKit

class User {
    var name = ""
    var password = ""
    
    init() {}
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    private var userEntity = User(name: "User", password: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 16

        passwordTF.isEnabled = false
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userNameValue = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func loginButtonTouched() {
        guard let inputText = userNameTF.text, !inputText.isEmpty, inputText == userEntity.name else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
            return
        }
        
        guard let inputText = passwordTF.text, !inputText.isEmpty, inputText == userEntity.password else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "Oops!", and: "Your name is \(userEntity.name) 😉")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your password is \(userEntity.password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (userNameTF.text?.isEmpty ?? true) {
            passwordTF.isEnabled = false
            textField.resignFirstResponder()
        }
        else if textField == userNameTF {
            passwordTF.isEnabled = true
            passwordTF.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
            loginButtonTouched()
        }
        
        return true
    }
    
}

// MARK: - Alert
extension LoginViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
