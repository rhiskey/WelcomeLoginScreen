//
//  WelcomeViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 23.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLB: UILabel!
    
    var userNameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLB.text = "Welcome, \(userNameValue ?? "")!"
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor.blue.cgColor
        let colorBottom = UIColor.purple.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}
