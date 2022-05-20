//
//  CreditsViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 3/14/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class CreditsViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var creditTextView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        creditTextView.text = "AACO mobile application developer and designers: Omar Noorzay and Siar Noorzay\n\nAACO Mobile App media sources: Wayve Media and Safi Edits\n\n2022 AAC Photographer(s): Nilab Osmani and Megan Latify\n2022 AAC Videographer(s): Fawad Assadullah"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupHeader() {
        
        let headerImage = UIImage(named: "creditsHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Credits", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
