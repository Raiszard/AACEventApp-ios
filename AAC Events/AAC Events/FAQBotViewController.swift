//
//  FAQBotViewController.swift
//  AAC Events
//
//  Created by Omar Noorzay on 6/1/23.
//  Copyright © 2023 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage
import SafariServices

class FAQBotViewController: UIViewController, SideMenuItemContent {
    
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 15)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()

    }
    
    
    @IBOutlet weak var FAQBot_text: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeader()
        
        
        
        FAQBot_text.attributedText = FAQBotText()
        

        // Do any additional setup after loading the view.
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            FAQBot_text.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    func FAQBotText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        
        let runningDescAttrString = NSMutableAttributedString()
        
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE WIFI PASSWORD?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNetwork Name: GWConnect\n\nInstructions:\n\n1. After selecting GWConnecton your wireless network list in settings, the GWConnect Splash Page for University Guests and Event Attendees page should open automatically. If it does not, open a web browser and navigate to a website - this should make it appear.\n\n2. Enter your name, a valid mobile phone number, and a valid email address.\n\n3. Note: If you do not have a mobile phone number that can accept text messages, you can leave the phone number field blank and the password will be emailed instead. \n\n4. Read and accept the terms of use; Click Register.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THERE TO DO IN WASHINGTON, D.C.?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nCheck out this curated list of things to do in Washington, D.C. and nearby on the days leading up to and after the conference (as well as after each conference day ends)!\n\nhttps://tinyurl.com/2vt9t53h\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "IS THERE A CAMPUS MAP AVAILABLE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes - check out this official interactive George Washington University campus map. All building names are also searchable from the iOS Map App and Google Maps.\n\nhttps://explore.gwu.edu/interactive-campus-map\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE DO I REGISTER AND PICK UP MY BADGE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe registration & badge desk location can be found on the Agenda tab. Should the registration location change, we will notify all participants. The registration desk will open at 8:30 AM on Friday, June 23rd.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO BRING A PICTURE ID TO REGISTER?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes, a valid picture ID w/ the first/last names you registered with will be required during the registration process and to pick up your badge. \n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO BRING A COVID-19 VACCINATION TO REGISTER?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNo, COVID-19 Vaccination card are not required to register.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO WEAR MY BADGE THROUGHOUT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nParticipants are required to wear their badge throughout the conference with no exceptions.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "I FORGOT/LOST MY BADGE, CAN I GET IT REPLACED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nTThere will be a $25 charge to replace any lost badges with no exceptions. To replace a lost badge, please visit the Registration Desk.\n\nIf you forgot your badge at your hotel, you have the option of going to your hotel to get it or paying the replacement fee, but you are required to return one of your badges to the Registration Desk the following day.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING GUESTS WITH ME TO THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nNo, we cannot accommodate any unregistered guests at the Conference. Only participants that have registered to attend will be allowed on the Conference premises with their participant name badge.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS THE PRAYER AREA LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nFor meditation and prayers, a designated room will be reserved. Please refer to the location presented on the agenda tab of the mobile app. Should this room assignment change, the planning team will notify participants.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE CLOSEST PARKING STRUCTURE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nGeorge Washington University has plenty of street parking available. Our recommended hotels are all a ten (10) minute walk from campus. We highly encourage local transportation/carpooling if not staying at one of our recommended hotels.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE SHOULD UBER/LYFT DROP ME OFF?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nPlease refer to the location presented on the agenda tab for Uber/Lyft to arrive at registration.\n\n", attributes: descriptionAttributes))
        
        
        runningDescAttrString.append(NSAttributedString(string: "I AM FEELING REALLY OVERWHELMED, WHO CAN I REACH OUT TO?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe CARE Team is composed of mental and physical health professionals who will be available throughout the weekend of the conference. To connect to a member of the CARE Team:\n\n1. Text a message to (213) 319-2540. Please include your name and a brief message explaining your need (medical attention or mental health).\n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I REACH OUT DIRECTLY TO AACO COMMITTEE MEMBERS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYes! If you ever find yourself lost, lost an item, or need non-medical assistance from an AACO Committee Member, feel free to connect w/ the team:\n\n1. Send an email to operations@aa-co.org. Please include your name and your question(s)/concern(s).\n\n2. An AACO Committee member will contact you as soon as possible to assist w/ your more general/non-medical concerns (for medical/mental health concerns, see above).\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I BRING FOOD/DRINKS INTO THE CLASSROOMS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, food and drinks are not permitted in classrooms or in any plenary space.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WILL LUGGAGE CHECK BE PROVIDED ON FRIDAY JUNE, 23rd or SUNDAY, JUNE 25TH?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nUnfortunately, we do not have a designated space to store your luggage. We recommend you check-in your luggage at your hotel bell desk.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT HAPPENS IF I SHOW UP LATE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe encourage all participants to arrive on time every day. To respect our speakers, doors will close to all plenary sessions and registered participants that arrive late will be asked to wait outside until the speaker on stage concludes their remarks.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHERE IS LOST AND FOUND LOCATED?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nIf you find a lost item, or have lost an item, please take it to the Registration desk at Jack Morton Auditorium where an AACO Committee Member will further assist you.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WHAT IS THE DRESS CODE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWe kindly ask participants to dress in business casual attire. However, some participants have changed into Afghan attire for the banquet on Saturday evening, and we recommend wearing your AAC shirt on Sunday.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "DO I NEED TO CHANGE FOR THE BANQUET?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYou are not required to change for the banquet. In the past, participants have changed into Afghan attire.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "CAN I PURCHASE AN AAC T-SHIRT AT THE CONFERENCE?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nA limited supply of t-shirts will be available at the conference at the registration location.\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "IS THERE A HASHTAG WE SHOULD USE FOR CONFERENCE PICTURES AND POSTS?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOf course there is! Please tag all pictures and posts with #AfgAm23\n\n", attributes: descriptionAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "WILL THERE BE AN AAC REUNION?", attributes: boldAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nDetails on AAC reunions will be shared after the Conference; Please stay tuned and be sure to follow us on social media for updates.\n\n", attributes: descriptionAttributes))
        
        
        return runningDescAttrString
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "FAQHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "FAQs", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    @IBAction func botButton(_ sender: Any) {
        
        var urlString = "https://askaaco.herokuapp.com"
        
        let url = URL(string: urlString)
        let svc = SFSafariViewController(url: url!)
        self.present(svc, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
