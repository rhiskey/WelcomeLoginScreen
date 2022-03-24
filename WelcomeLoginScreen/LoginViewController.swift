//
//  ViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 23.03.2022.
//

import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    // MARK: - Private properties
    private var userEntity = User(name: "User", password: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 16

        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userNameValue = userNameTF.text
    }
    
    
    // MARK: - IBActions
    @IBAction func loginButtonTouched() {
//        if userNameTF.text != userEntity.name || passwordTF.text != userEntity.password
        guard let inputText = userNameTF.text, inputText == userEntity.name else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password", textField: userNameTF)
            return
        }
        
        guard let inputText = passwordTF.text, inputText == userEntity.password else {
            passwordTF.text = ""
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password", textField: passwordTF)
            return
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0 ?
        showAlert(title: "Oops!", message: "Your name is \(userEntity.name) 😉") :
        showAlert(title: "Oops!", message: "Your password is \(userEntity.password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Alert
extension LoginViewController {
    private func showAlert(title: String, message massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            //textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonTouched()
            performSegue(withIdentifier: "WelcomeShow", sender: nil)
        }
        return true
    }
}
