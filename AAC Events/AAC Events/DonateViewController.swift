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
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var donateTextView: UITextView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
         donateTextView.attributedText = DonateText()
        /*donateTextView.text = "We invite you to contribute to our groundbreaking conference and our year-round work. \n\nThe Afghan-American Conference is made possible with generous financial support from donors and sponsors. The three-day long conference is the marquee event in the Afghan-American community, with attendance at this year's conference in New York expected to reach nearly 500 people. Your donation will also go toward funding the other year-round work our organization does for the Afghan-American community. \n\nHOW YOU CAN HELP \n\nAs a conference intended to bring together Afghan-Americans from all walks of life and various stages of professional development, it is our intention to ensure that cost does not become an obstacle to participation. In order to ensure AAC's success and the participation of those who have applied, we have set ambitious goals this year to help with fee waivers to attend the conference and subsidized ticket prices for those with financial need. \n\nOur team continues to work diligently to manage costs and pursue funding and in-kind support for the event. Here's what you can do to help: \n\n• Donate to this campaign. \n\n• Support the fee waiver fund: sponsor a ticket for someone else to attend who is otherwise unable. \n\n• Share the link and spread the word. \n\n• Apply to attend the Afghan-American Conference to learn, discuss, and take steps towards strengthening our diaspora. \n\n• Apply to speak or contact us to share your story, pictures, and experiences. \n\n• Use the hashtag #AfgAm19 on social media. \n\nYour support has been critical to our past success and we want you to be a part of the great things that lie ahead. With your help, we can continue and even expand our work for the community. \n\nWe're also pleased to share that we have commenced the process of becoming a 501(c)(3) nonprofit organization so your donation will be tax-deductible.";*/


        // Do any additional setup after loading the view.
    }
    
    func DonateText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        let descboldAttributes = [NSAttributedStringKey.font: descboldFont]
        
       // let paragraph = NSMutableParagraphStyle()
      //  paragraph.alignment = .center
        
        
        let donateAttributes = [
            NSAttributedStringKey.link: URL(string: "https://tinyurl.com/2p9yxj9d")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
           // NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let sponsorAttributes = [
            NSAttributedStringKey.link: URL(string: "https://aa-co.org/sponsor")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let amznsmileAttributes = [
            NSAttributedStringKey.link: URL(string: "https://smile.amazon.com")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.10, green: 0.67, blue: 0.89, alpha: 1.00),
         //   NSAttributedStringKey.paragraphStyle: paragraph
            ] as [NSAttributedStringKey : Any]
        
        let runningDescAttrString = NSMutableAttributedString()
        
        runningDescAttrString.append(NSAttributedString(string: "Donate", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nAACO is a 501(c)3 tax-exempt non-profit organization that is funded through the generosity of its donors and sponsors.  Your support has been critical to our past success and we want you to be a part of the great things that lie ahead.\n\nWith your help, initiatives like the Afghan-American Conference are made possible, alongside our other initiatives for the community both in the U.S. and in Afghanistan. Together, we will build a more supportive, empowered, and engaged community.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "Donate today", attributes: donateAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nSponsor", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nAACO offers a number of sponsorship opportunities/packages. It is our sincere hope that you consider becoming a part of the great work we’re doing by contributing what you can. Thank you in advance for your generosity.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "Become a Sponsor\n\n", attributes: sponsorAttributes))
        
        runningDescAttrString.append(NSAttributedString(string: "AmazonSmile", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nDo you use Amazon? What if you could support AACO simply by shopping? With AmazonSmile, now you can! We are proud to announce that the Afghan-American Community Organization is now listed on AmazonSmile! Once activated, 0.5% of your eligible Amazon purchases will be donated to our organization, at no extra cost to you. This is the perfect way to give all year round— we highly encourage you all to activate AmazonSmile today!\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\nHow to use AmazonSmile on a web browser:", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\n1. Visit smile.amazon.com\n\n2. Sign in with the same account you use for Amazon.com\n\n3. Search for Afghan American Community Organization and make it your selection\n\n4. Start shopping! Remember to checkout at smile.amazon.com to generate donations for AACO.\n\nTip: Add a bookmark to make it easier to shop at smile.amazon.com.\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\nHow to use AmazonSmile using the Amazon app on your mobile phone:", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\n1. Open the Amazon Shopping app\n\n2. Navigate to the main menu (=)\n\n3. Tap on Settings and then select “AmazonSmile”\n\n4. Search for and select Afghan American Community Organization\n\n 5. Follow the on-screen instructions to turn ON AmazonSmile in the mobile app\n\nOnce AmazonSmile has been activated in your app, future eligible app purchases will generate a donation for the charity you have selected.\n\nNote: The tablet app is not yet supported. Please visit smile.amazon.com/onthego to learn more.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "Get started with AmazonSmile", attributes: amznsmileAttributes))
    
        
        
        return runningDescAttrString
        
        
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            donateTextView.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donatePressed(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.launchgood.com/AAC19")!, options: [:], completionHandler: nil)
    }
        
    func setupHeader() {
        
        let headerImage = UIImage(named: "donateHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Support AACO", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
