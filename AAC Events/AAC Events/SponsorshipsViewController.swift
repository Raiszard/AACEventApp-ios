//
//  SponsorshipsViewController.swift
//  AAC Events
//
//  Created by Omar Noorzay on 5/30/23.
//  Copyright © 2023 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SafariServices

class SponsorshipsViewController: UIViewController, SideMenuItemContent {
    
    let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
    let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)

    @IBOutlet weak var headerContainer: UIView!
    

    @IBOutlet weak var sponsorshipsText: UITextView!
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeader()
        sponsorshipsText.attributedText = SponsorshipsText()

        // Do any additional setup after loading the view.
    }
    
    func SponsorshipsText() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        let descboldAttributes = [NSAttributedStringKey.font: descboldFont]
        
       // let paragraph = NSMutableParagraphStyle()
      //  paragraph.alignment = .center
        
        
  
        
        let runningDescAttrString = NSMutableAttributedString()
    
        
        runningDescAttrString.append(NSAttributedString(string: "To view a complete list of our sponsors, click the button below!\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
       
        
    
        
        
        return runningDescAttrString
        
        
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            sponsorshipsText.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "Session7")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Sponsors", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func sponsorshipsButton(_ sender: Any) {
        
        var urlString = "https://www.aa-co.org/sponsors"
        
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
