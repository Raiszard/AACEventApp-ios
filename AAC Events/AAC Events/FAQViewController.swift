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
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            FAQtextView.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    func FAQText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        
        let runningDescAttrString = NSMutableAttributedString()
        
        
        runningDescAttrString.append(NSAttributedString(string: "I REGISTERED FOR A ONE DAY PASS AND/OR JUST FOR MY SESSION, BUT WOULD LIKE TO STAY FOR THE ENTIRE CONFERENCE. HOW CAN I UPGRADE MY REGISTRATION?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nPlease visit the Registration Desk located outside of the Crystal Cove Auditorium in the Student Center building.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE DO I REGISTER AND PICK UP MY BADGE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe registration & badge desk is located outside of the Crystal Cove Auditorium in the Student Center building. The registration desk will open at 9am on Friday, June 21st.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO BRING A PICTURE ID TO REGISTER?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes, a picture ID will be required to register and pick-up your badge.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO WEAR MY BADGE THROUGHOUT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nParticipants are required to wear their badge throughout the conference with no exceptions. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I FORGOT/LOST MY BADGE, CAN I GET IT REPLACED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThere will be a $25 charge to replace any lost badges with no exceptions. To replace a lost badge, please visit the Registration Desk outside the Crystal Cove Auditorium.\n\nIf you forgot your badge at your hotel, you have the option of going to your hotel to get it or paying the replacement fee, but you are required to return one of your badges to the Registration Resk the following day.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING GUESTS WITH ME TO THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNo, we cannot accommodate any unregistered guests at the Conference. Only participants that have registered to attend will be allowed on Conference premises with their participant name badge. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS THE PRAYER AREA LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nGiven space constraints, the prayer area may shift daily.  Please visit the Registration Desk for exact prayer location or ask a Planning Team Member or Conference Ambassador. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE CLOSEST PARKING STRUCTURE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe recommend parking in the Student Center Parking Structure, which is directly across Pereira Drive from the Student Center. Do not park at the University Towne Center, as they tow cars there. If for some reason the Student Center Parking Structure is full, you may also park in the Social Science Parking Structure. You may purchase a daily permit using credit card or cash. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "HOW MUCH IS PARKING?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nParking at the above listed structure is $10/day.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE SHOULD UBER/LYFT DROP ME OFF?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nPlease type “UCI Student Center & Event Services.” If using Uber, typing that will be sufficient. If using Lyft, you can then select “Student Center.”\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I AM FEELING REALLY OVERWHELMED, WHO CAN I REACH OUT TO?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe AAC Care Team is comprised of mental health professionals available throughout the weekend of the conference. To connect to a member of the Care Team:\n\n1. Send a message to (240) 513-8190‬. Make sure to include your name and a brief message so we connect you with the best person.\n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING FOOD/DRINKS INTO THE CLASSROOMS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, food and drinks are not permitted in classrooms.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WILL LUGGAGE CHECK BE PROVIDED ON SUNDAY, JUNE 23RD?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, we do not have a designated space to store your luggage. We recommend you check-in your luggage at your hotel bell desk.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT HAPPENS IF I SHOW UP LATE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe encourage all participants to arrive on time every day. To respect our speakers, doors will close to all plenary sessions and registered participants that arrive late will be asked to wait outside until the speaker on stage concludes their remarks.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS LOST AND FOUND LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nIf you find a lost item, please return it at the Registration Desk located outside the Crystal Cove Auditorium. If you’ve lost an item, please visit the registration desk.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE DRESS CODE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe kindly ask participants to dress in business casual attire. However, some participants have changed into Afghan attire for the banquet, and we recommend wearing your AAC shirt on Sunday.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO CHANGE FOR THE BANQUET?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYou are not required to change for the banquet. In the past, participants have changed into Afghan attire.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I PURCHASE AN AAC T-SHIRT AT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nA limited supply of t-shirts will be available at the conference outside the Crystal Cove Auditorium. Prices as follows: $25 for Short Sleeve T-shirts / $30 for Long Sleeve Shirts\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "IS THERE A HASHTAG WE SHOULD USE FOR CONFERENCE PICTURES AND POSTS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOf course there is! Please tag all pictures and posts with #AfgAm19\n\n", attributes: descriptionAttributes))
        
        
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
