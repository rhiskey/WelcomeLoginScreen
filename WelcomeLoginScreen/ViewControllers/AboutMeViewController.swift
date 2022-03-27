//
//  AboutMeViewController.swift
//  WelcomeLoginScreen
//
//  Created by Владимир Киселев on 26.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var moreBT: UIButton!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreBT.setTitle("More Info", for: .normal)
        tabBarItem.title = user.person.fullName
        title = user.person.fullName
        
        //performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        
        guard let detailsVC = viewController as? DetailsViewController else { return }
        detailsVC.user = user
    }
    


}
