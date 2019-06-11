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
    

    

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        textView.text = "What is the CARE Team?\n\nThe AAC CARE Team contributes to the creation of a safe(r) space at the conference by providing additional support for participants during the weekend. The team is comprised of professional therapists along with those who have experience working in mental health or related fields. \n\nUpon request, the CARE Team is available to check in with particpants who may be experiencing difficulty throughout the weekend. This could range from anxiety being around so many people, being triggered by certain topics, or just needing a person to check-in and talk with. They are available to support you in bringing your fullest self at AAC!\n\nHow to Connect with a CARE Team Member:\n\n1. Send a message to (240) 513-8190‬. Make sure to include your name and a brief message so we connect you with the best person. \n\n2. An available CARE Team member will contact you as soon as possible to coordinate a designated place to meet or set up a phone call.\n\n "

        // Do any additional setup after loading the view.
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
        
        let hView = header.createHeader(title: "AACare Team", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func contactAACaare(_ sender: Any) {
        
        if (MFMessageComposeViewController.canSendText()){
            
            let controller = MFMessageComposeViewController ()
            
            controller.body = ""
            controller.recipients = ["2405138190‬"]
            controller.messageComposeDelegate = self
            
            self.present(controller, animated: true, completion: nil)
            
        }


        print ("Button pressed")

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
