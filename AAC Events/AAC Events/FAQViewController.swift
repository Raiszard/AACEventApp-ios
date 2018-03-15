//
//  FAQViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/13/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage
import SafariServices

class FAQViewController: UIViewController, SideMenuItemContent {
    let boldFont = UIFont(name: "Avenir-Medium", size: 15)
    let descriptionFont = UIFont(name: "Avenir-Book", size: 15)
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()

    }
    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var FAQtextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        
        
        FAQtextView.attributedText = FAQText()


        // Do any additional setup after loading the view.
    }
    
    func FAQText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        
        let runningDescAttrString = NSMutableAttributedString()
        
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE AFGHAN-AMERICAN CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe Afghan-American Conference is an annual conference for members of the Afghan-American community to engage in meaningful dialogue, grow professionally, and build relationships. \n\nThe conference is equal parts professional, cultural, spiritual, social, and personal. It is a holistic event consisting of keynote speeches, and S.E.E.D Talks (Supportive Engaged Empowered Diaspora). professional panels, skill-building workshops, roundtable discussions, safe space caucuses, town halls, networking mixers and arts and entertainment. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHO HOSTS THE AFGHAN-AMERICAN CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe conference is an annual event hosted by the Afghan-American Community Organization and produced by a conference Organizing Committee. This committee and the many subcommittees that support it  consist of Afghan-American professionals and students hailing from across the U.S. Please refer to the Committee section of our website to learn more about the Organizing Committee. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHO IS THIS EVENT FOR?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThis conference is open to all individuals who identify as members of the Afghan diaspora. It is targeted to young Afghans who grew up in America, but Afghans of all ages and any diaspora worldwide are welcome to apply. All participants must be over the age of 18 or high school graduates. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHY DO YOU ENCOURAGE YOUNG AFGHANS SPECIFICALLY TO APPLY?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOur goal is to provide a safe space for up and coming members of our community to come together. We acknowledge that more established members in the community are integral and their wisdom and experiences are invaluable. That is why anyone of any age can apply to attend. However, for now at least, AAC lacks the organizational capacity and resources to organize an event catered to all age ranges. We look forward to supporting and partnering with future initiatives that will help us one day engage ALL members of our community. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I HAVE GREAT IDEAS. MAY I PRESENT AT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes! Attendees have two options to present: Session Topics and and S.E.E.D Talks (Supportive Engaged Empowered Diaspora). \n\nS.E.E.D Talks (Supportive Engaged Empowered Diaspora) \n\nThroughout the weekend, conference participants can give short (5-10 minutes) talks on any topic. Participants interested in giving S.E.E.D Talks will be required to submit a script, audition tape, and if applicable, a PowerPoint presentation.We are always looking for dynamic, accomplished and passionate speakers. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE CONFERENCE DRESS CODE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe attire is business casual all weekend. Attendees may choose to wear traditional Afghan garb at the Saturday evening banquet. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT MATERIALS SHOULD I BRING?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nTo get the most out of this experience, we recommend bringing notebooks and pens to take notes. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I HAVE SPECIAL DIETARY NEEDS. CAN THOSE BE ACCOMMODATED AT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe will make every effort to offer Halal/Zabiha and vegetarian options. Beyond that, please email us separately with your dietary needs if you are admitted to the conference, and we will try to accommodate as best we can. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I HAVE ANOTHER QUESTION NOT LISTED HERE. CAN YOU HELP ME?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes! Please send us an email at afghanamericanconference@gmail.com with your question.", attributes: descriptionAttributes))
        
        
        return runningDescAttrString
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "FAQHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "FAQ", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
