//
//  DonateViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage
import SafariServices

class DonateViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var donateTextView: UITextView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        donateTextView.text = "We invite you to contribute to our groundbreaking conference and our year-round work. \n\nThe Afghan-American Conference is made possible with generous financial support from donors and sponsors. The three-day long conference is the marquee event in the Afghan-American community, with attendance at this year's conference in New York expected to reach nearly 500 people. Your donation will also go toward funding the other year-round work our organization does for the Afghan-American community. \n\nHOW YOU CAN HELP \n\nAs a conference intended to bring together Afghan-Americans from all walks of life and various stages of professional development, it is our intention to ensure that cost does not become an obstacle to participation. In order to ensure AAC's success and the participation of those who have applied, we have set ambitious goals this year to help with fee waivers to attend the conference and subsidized ticket prices for those with financial need. \n\nOur team continues to work diligently to manage costs and pursue funding and in-kind support for the event. Here's what you can do to help: \n\n- Donate to this campaign \n\n- Support the fee waiver fund: sponsor a ticket for someone else to attend who is otherwise unable \n\n- Share the link and spread the word \n\n- Apply to attend the Afghan-American Conference to learn, discuss, and take steps towards strengthening our diaspora. \n\n- Apply to speak or contact us to share your story, pictures, and experiences \n\n- Use the hashtag #AfgAm18 on social media. \n\nYour support has been critical to our past success and we want you to be a part of the great things that lie ahead. With your help, we can continue and even expand our work for the community. \n\nWe're also pleased to share that we have commenced the process of becoming a 501(c)(3) nonprofit organization so your donation will be tax-deductible.";


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donatePressed(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://secure.squarespace.com/commerce/donate?donatePageId=588deeae37c5818a6a00fd0d")!, options: [:], completionHandler: nil)
    }
        
    func setupHeader() {
        
        let headerImage = UIImage(named: "donateHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Donate", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
