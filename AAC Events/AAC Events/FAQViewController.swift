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
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 15)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    
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
        
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE WIFI PASSWORD?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNetwork Name: UCD-Guest\n\nInstructions:\n\n1. After selecting UCD-Guest on your wireless network list in settings, the UCD-Guest Registration/Login page should open automatically. If it does not, open a web browser and navigate to a website - this should make it appear.\n\n2. Enter your name, a valid mobile phone number, and a valid email address.\n\n3. Note: If you do not have a mobile phone number that can accept text messages, you can leave the phone number field blank and the password will be emailed instead.\n\n4. Read and accept the terms of use; Click Register.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THERE TO DO IN DAVIS CA?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nCheck out this curated list of things to do in Davis and nearby on the days leading up to and after the conference (as well as after each conference day ends)!\n\nhttp://aa-co.org/s/AAC-2022-Davis-Recommendations.pdf\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "IS THERE A CAMPUS MAP AVAILABLE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes - check out this official interactive UC Davis campus map. All building names are also searchable from the iOS Map App and Google Maps.\n\nhttps://campusmap.ucdavis.edu/ \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE DO I REGISTER AND PICK UP MY BADGE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe registration & badge desk is located inside the lobby of California Hall. The registration desk will open at 9am on Friday, June 17th.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO BRING A PICTURE ID TO REGISTER?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes, a valid picture ID w/ the first/last names you registered with will be required during the registration process and to pick up your badge. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO BRING A COVID-19 VACCINATION TO REGISTER?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes, a valid COVID-19 Vaccination card (or photocopy) is required to register and pick up your badge (names on picture ID must match COVID-19 Vaccination cards).\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO WEAR MY BADGE THROUGHOUT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nParticipants are required to wear their badge throughout the conference with no exceptions.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I FORGOT/LOST MY BADGE, CAN I GET IT REPLACED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThere will be a $25 charge to replace any lost badges with no exceptions. To replace a lost badge, please visit the Registration Desk inside the lobby of California Hall.\n\nIf you forgot your badge at your hotel, you have the option of going to your hotel to get it or paying the replacement fee, but you are required to return one of your badges to the Registration Desk the following day.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING GUESTS WITH ME TO THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNo, we cannot accommodate any unregistered guests at the Conference. Only participants that have registered to attend will be allowed on the Conference premises with their participant name badge.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS THE PRAYER AREA LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nJummah Prayer will take place at the Islamic Center of Davis. For all other meditation and prayers, Oslon 167 has been reserved.  Should this room assignment change, the planning team will notify participants.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE CLOSEST PARKING STRUCTURE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe recommend parking in Visitor Parking Lot 25 which is a 7 min walk away from Registration and other buildings where programming will take place. You may also park at Visitor Parking 5 (just as far away).\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "HOW MUCH IS PARKING?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nParking at the above listed structure is $10/day, and only needed to be paid on Friday, June 17th. Parking is free on both Saturday and Sunday. You will need to download the ParkMobile app and purchase your daily parking ticket on Friday, June 17th.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE SHOULD UBER/LYFT DROP ME OFF?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nPlease type “UCD California Hall” on Uber/Lyft as shown to arrive to registration.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I AM FEELING REALLY OVERWHELMED, WHO CAN I REACH OUT TO?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe CARE Team is composed of mental and physical health professionals who will be available throughout the weekend of the conference. To connect to a member of the CARE Team:\n\n1. Text a message to (213) 319-2540. Please include your name and a brief message explaining your need (medical attention or mental health).\n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I REACH OUT DIRECTLY TO AACO COMMITTEE MEMBERS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes! If you ever find yourself lost, lost an item, or need non-medical assistance from an AACO Committee Member, feel free to connect w/ the team:\n\n1. Send a message to (213) 320-6482. Please include your name and your question(s)/concern(s).\n\n2. An AACO Committee member will contact you as soon as possible to assist w/ your more general/non-medical concerns (for medical/mental health concerns, see above).\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING FOOD/DRINKS INTO THE CLASSROOMS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, food and drinks are not permitted in classrooms.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WILL LUGGAGE CHECK BE PROVIDED ON FRIDAY JUNE, 17th or SUNDAY, JUNE 19TH?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, we do not have a designated space to store your luggage. We recommend you check-in your luggage at your hotel bell desk.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT HAPPENS IF I SHOW UP LATE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe encourage all participants to arrive on time every day. To respect our speakers, doors will close to all plenary sessions and registered participants that arrive late will be asked to wait outside until the speaker on stage concludes their remarks.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS LOST AND FOUND LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nIf you find a lost item, or have lost an item, please take it to Olson Hall, Room 109 where an AACO Committee Member will further assist you. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE DRESS CODE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe kindly ask participants to dress in business casual attire. However, some participants have changed into Afghan attire for the banquet on Saturday evening, and we recommend wearing your AAC shirt on Sunday\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO CHANGE FOR THE BANQUET?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYou are not required to change for the banquet. In the past, participants have changed into Afghan attire.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I PURCHASE AN AAC T-SHIRT AT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nA limited supply of t-shirts will be available at the conference inside the lobby of California Hall. Prices are as follows: $30 for Short Sleeve T-shirts / $35 for Long Sleeve Shirts. Please note that there is an additional $2 surcharge for XXL+ shirts due to supply-chain reasons.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "IS THERE A HASHTAG WE SHOULD USE FOR CONFERENCE PICTURES AND POSTS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOf course there is! Please tag all pictures and posts with #AfgAm22\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WILL THERE BE AN AAC REUNION?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nDetails on AAC reunions will be shared after the conference; Please stay tuned and be sure to follow us on social media for updates.\n\n", attributes: descriptionAttributes))
        
        
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
