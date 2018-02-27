//
//  SponsorDetailsViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 1/9/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class SponsorDetailsViewController: UIViewController {

    @IBOutlet weak var sponsorDetailsTextView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    @IBOutlet weak var sponsorLevelLabel: UILabel!
    @IBOutlet weak var lineViewHeightConstraint: NSLayoutConstraint!
    
    var sponsor: Sponsor!
    var sponsorLevel: String!
    
//    @IBAction func openMenu(_ sender: UIButton) {
//        showSideMenu()
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHeader()
        
        if sponsor != nil {
            sponsorDetailsTextView.text = sponsor.sponsorDescription
            sponsorNameLabel.text = sponsor.name
            sponsorLevelLabel.text = sponsorLevel
        }
    }
    
    func setupHeader() {
        
        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "", subtitle:nil, imageURL: sponsor.headerImageURL, image: nil, isProfile: false)
        
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
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

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
