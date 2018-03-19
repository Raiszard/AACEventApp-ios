//
//  AACareViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 3/18/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class AACareViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        textView.text = "AAC can be an uplifting, inspiring, and empowering experience for many. However, we have also found that three days of interactions and conversations can also be overwhelming and difficult for some. This year, we hope to be proactive and better prepared for participants that may need some additional support by incorporating an AACare Team, a team of 'on-call' individuals readily available to provide support for participants that weekend. The AACare Team will be responsible for helping participants who may have difficulty during the weekend - ranging from anxiety being around so many people, being triggered from particular conversations/topics, or just needing a person to check-in with. The team will consist of trusted alumni, professional therapists, and/or individuals that have experience working in mental health or related fields."

        // Do any additional setup after loading the view.
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            textView.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "AACare")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "AACare Team", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
