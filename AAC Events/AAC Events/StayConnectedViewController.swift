//
//  StayConnectedViewController.swift
//  AAC Events
//
//  Created by Omar Noorzay on 5/9/23.
//  Copyright © 2023 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import MessageUI


class StayConnectedViewController: UIViewController, SideMenuItemContent{
    
    @IBOutlet weak var stayconnectedText: UITextView!
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)
    

    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        stayconnectedText.attributedText = SocialText()
        //infoText.text = "UCI WI-FI\n\nNetwork Name: Student Center Visitors\nPassword: anteaters\n\nSOCIAL MEDIA - Please Tag All Pictures #AfgAm19\n\nIG: @afghanamericanconference - https://tinyurl.com/y3zwahbe\nFB: @afghanamericanconference - https://tinyurl.com/y3f6lda5\nTwitter:@afghanamericanc - https://tinyurl.com/yxcc9owg\nSnapchat: @afghanamericanc\nWebsite: afghanamericanconference.org\n\nTHINGS TO DO IN ORANGE COUNTY:\n\nhttps://tinyurl.com/y2uarvt8\n\nREUNIONS\n\nOfficial AAC Reunions (July 13th-21st). Details to be posted on 2019 AACP Facebook Page\n\n"


    }
    
    func SocialText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        let descboldAttributes = [NSAttributedStringKey.font: descboldFont]
        
       // let paragraph = NSMutableParagraphStyle()
      //  paragraph.alignment = .center
        
        
        let igAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.instagram.com/afghanamericancommunityorg/")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
           // NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let fbAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.facebook.com/afghanamericancommunityorganization")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let twitterAttributes = [
            NSAttributedStringKey.link: URL(string: "https://twitter.com/afgamco")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let linkedinAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.linkedin.com/company/afghan-american-community-organization")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let tiktokAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.tiktok.com/@afgamco")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        let youtubeAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.youtube.com/c/AfghanAmericanConference?app=desktop&themeRefresh=1")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]

        
        let websiteAttributes = [
            NSAttributedStringKey.link: URL(string: "https://aa-co.org")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Light", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let runningDescAttrString = NSMutableAttributedString()
        
        runningDescAttrString.append(NSAttributedString(string: "Please tag all pictures #AfgAm23 and don't forget to follow us on our social media channels to stay connected!\n\nInstagram: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@afghanamericancommunityorg", attributes: igAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nFacebook: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@Afghan-American Community Organization", attributes: fbAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nTwitter: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@AfgAmCo", attributes: twitterAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nLinkedIn: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@Afghan-American Community Organization", attributes: linkedinAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nTikTok: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@AfgAmCo", attributes: tiktokAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nYouTube: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "@AfghanAmericanCommunityOrg", attributes: youtubeAttributes))
        
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nWebsite: ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "aa-co.org\n\n", attributes: websiteAttributes))
        
    
        
        
        return runningDescAttrString
        
        
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            stayconnectedText.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "stayconnectedHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Stay Connected", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
