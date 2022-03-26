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
    private let userEntity = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 16
        
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let tabBarController = segue.destination as! UITabBarController
        
        // Select all view controllers from tabBar
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = userEntity.person.firstName
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                
                aboutUserVC.tabBarItem.title = "\(userEntity.person.firstName) \(userEntity.person.lastName)"
                aboutUserVC.title = "\(userEntity.person.firstName) \(userEntity.person.lastName)"

                aboutUserVC.job = userEntity.person.job
                aboutUserVC.hobby = userEntity.person.hobby
                aboutUserVC.skills = userEntity.person.about
            }
        }
    }
    
    
    // MARK: - IBActions
    @IBAction func loginButtonTouched() {
        if userNameTF.text != userEntity.name || passwordTF.text != userEntity.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
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
            textField?.text = ""
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
            performSegue(withIdentifier: "showWelcome", sender: nil)
        }
        return true
    }
}
