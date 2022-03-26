//
//  DetailsViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 26.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var jobLB: UILabel!
    @IBOutlet var hobbyLB: UILabel!
    @IBOutlet var skillsLB: UILabel!
    
    var job = ""
    var hobby = ""
    var skills = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobLB.text = job
        hobbyLB.text = hobby
        skillsLB.text = skills
    }
    

}
