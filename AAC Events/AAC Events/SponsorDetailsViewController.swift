//
//  SponsorDetailsViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 1/9/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class SponsorDetailsViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var sponsorDetailsTextView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    @IBOutlet weak var sponsorLevelLabel: UILabel!
    @IBOutlet weak var lineViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHeader()
    }
    
    func setupHeader() {
        
        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "", subtitle:nil, imageURL: nil, image: testImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lineViewHeightConstraint.constant = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
