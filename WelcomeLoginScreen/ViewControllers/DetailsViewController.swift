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
    
    @IBOutlet var imageIV: UIImageView! {
        didSet {
            imageIV.layer.cornerRadius = imageIV.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobLB.text = user.person.job
        hobbyLB.text = user.person.hobby
        skillsLB.text = user.person.about
        
        imageIV.image = UIImage(named: user.person.image)
    }
    

}
