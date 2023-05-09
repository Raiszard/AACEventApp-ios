//
//  InformationViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 5/23/19.
//  Copyright © 2019 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import MessageUI


class InformationViewController: UIViewController, SideMenuItemContent, MFMessageComposeViewControllerDelegate{
    
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var infoText: UITextView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        infoText.attributedText = ContactUsText()
        //infoText.text = "UCI WI-FI\n\nNetwork Name: Student Center Visitors\nPassword: anteaters\n\nSOCIAL MEDIA - Please Tag All Pictures #AfgAm19\n\nIG: @afghanamericanconference - https://tinyurl.com/y3zwahbe\nFB: @afghanamericanconference - https://tinyurl.com/y3f6lda5\nTwitter:@afghanamericanc - https://tinyurl.com/yxcc9owg\nSnapchat: @afghanamericanc\nWebsite: afghanamericanconference.org\n\nTHINGS TO DO IN ORANGE COUNTY:\n\nhttps://tinyurl.com/y2uarvt8\n\nREUNIONS\n\nOfficial AAC Reunions (July 13th-21st). Details to be posted on 2019 AACP Facebook Page\n\n"


    }
    
    func ContactUsText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        let descboldAttributes = [NSAttributedStringKey.font: descboldFont]
        
       // let paragraph = NSMutableParagraphStyle()
      //  paragraph.alignment = .center
        
        
  
        
        let runningDescAttrString = NSMutableAttributedString()
        
        runningDescAttrString.append(NSAttributedString(string: "Committee Contacts", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nGeneral: info@aa-co.org\n\nBoard of Directors: board@aa-co.org\n\nMarketing: marketing@aa-co.org\n\nOperations: operations@aa-co.org\n\nProgramming: programming@aa-co.org", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
       
        
    
        
        
        return runningDescAttrString
        
        
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            infoText.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "Session8")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Contact Us", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func textus(_ sender: Any) {
        
        if (MFMessageComposeViewController.canSendText()){
              
              let controller = MFMessageComposeViewController ()
              
              controller.body = ""
              controller.recipients = ["2133206482"]
              controller.messageComposeDelegate = self
              
              self.present(controller, animated: true, completion: nil)
              
          }
        
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
