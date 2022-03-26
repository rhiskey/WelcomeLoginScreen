//
//  AboutMeViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 26.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var moreBT: UIButton!
    
    var job = ""
    var hobby = ""
    var skills = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreBT.setTitle("More Info", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        
        if let detailsVC = viewController as? DetailsViewController {
            detailsVC.job = job
            detailsVC.hobby = hobby
            detailsVC.skills = skills
        }
    }

}
