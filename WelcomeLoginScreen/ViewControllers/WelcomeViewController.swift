//
//  WelcomeViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 23.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLB: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLB.text = "Welcome, \(userName)!"
    }

    override func viewWillAppear(_ animated: Bool) {
        view.setGradientBackground()
        super.viewWillAppear(animated)
    }
    
}

// MARK: - Set BG Color
extension UIView {
    func setGradientBackground() {
        let colorTop =  UIColor.blue.cgColor
        let colorBottom = UIColor.purple.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at:0)
    }
}
