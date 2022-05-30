//
//  AACareViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 3/18/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import MessageUI


class AACareViewController: UIViewController, SideMenuItemContent, MFMessageComposeViewControllerDelegate{
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)
    

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        textView.attributedText = AACareText()
       // textView.text = "What is the CARE Team?\n\nThe AAC CARE Team contributes to the creation of a safe(r) space at the conference by providing additional support for participants during the weekend. The team is comprised of professional therapists along with those who have experience working in mental health or related fields. \n\nUpon request, the CARE Team is available to check in with particpants who may be experiencing difficulty throughout the weekend. This could range from anxiety being around so many people, being triggered by certain topics, or just needing a person to check-in and talk with. They are available to support you in bringing your fullest self at AAC!\n\nHow to Connect with a CARE Team Member:\n\n1. Send a message to (240) 513-8190‬. Make sure to include your name and a brief message so we connect you with the best person. \n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n "

        // Do any additional setup after loading the view.
        
        
    }
    
    func AACareText() -> NSAttributedString {
    let boldAttributes = [NSAttributedStringKey.font: boldFont]
    let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
    let descboldAttributes = [NSAttributedStringKey.font: descboldFont]
    
    let runningDescAttrString = NSMutableAttributedString()
    
    runningDescAttrString.append(NSAttributedString(string: "What is the CARE Team?", attributes: boldAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "\n\nThe CARE Team contributes to ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "C", attributes: boldAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "reating ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "A ", attributes: boldAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "R", attributes: boldAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "esilent ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "E", attributes: boldAttributes as [NSAttributedStringKey : Any]))
    
    runningDescAttrString.append(NSAttributedString(string: "nvironment ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
    
    
    runningDescAttrString.append(NSAttributedString(string: " at AAC as members of our diaspora who possess medical, emotional, and/or mental health training.\n\nUpon request, the CARE Team is available to meet one-on-one with any conference attendee to address medical and/or mental health concerns throughout the weekend. CARE Team members may respond to instances of injury, illness, anxiety, emotional distress/triggers, and wellness checks. They are available to support you in bringing your fullest self at AAC!\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "How to Connect with the CARE Team:\n\n", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "1. Text a message to (213) 319-2540. Please include your name and a brief message explaining your need (medical attention or mental health).\n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "CARE Team Members\n\n", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Faria Alamkhel", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Mental Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Shekiba Azad", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Mental Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Nilo Sidiqi", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Mental Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Omar Asefi", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Medical Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Sophia Mohabbat", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Medical Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Haron Mujtaba", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Medical Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Zahoor Sadiq", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " - Medical Health\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        return runningDescAttrString
        
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
        
        let hView = header.createHeader(title: "CARE Team", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func careButton(_ sender: Any) {
        if (MFMessageComposeViewController.canSendText()){
              
              let controller = MFMessageComposeViewController ()
              
              controller.body = ""
              controller.recipients = ["2133192540"]
              controller.messageComposeDelegate = self
              
              self.present(controller, animated: true, completion: nil)
              
          }

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
