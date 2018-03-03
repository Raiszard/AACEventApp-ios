//
//  AboutViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class AboutViewController: UIViewController, SideMenuItemContent {
    @IBOutlet var headerContainer: UIView!
    
    @IBOutlet weak var aboutSegmentedControl: UISegmentedControl!
    @IBOutlet weak var aboutTextView: UITextView!

    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    var api: API!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setupHeader()
        
        api = API()
        api.retrieveAgenda()
        
        self.aboutSegmentedControl.selectedSegmentIndex = 0
        aboutTextView.text = "The Afghan-American diaspora has historically lacked a safe space for candid discussions about the issues most pertinent to us. Traditionally, our community has come together almost exclusively in social settings, including weddings, concerts, picnics, and sports tournaments. However, none of these gatherings have been conducive to serious discussions about the state of our community. Too often, taboo topics have been swept under the proverbial Afghan rug, never to be broached or approached. \n\nGiven the impoverished state of Afghanistan, it is understandable that so much of our diaspora’s civic attention has focused on humanitarian relief for the Motherland. But in doing so, we have lost sight of our own community's struggles here in the United States. \n\nA WAY FORWARD \n\nThis is where the Afghan-American Conference comes into the picture. AAC provides a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, and activating change from within the community. We won’t be able to address everything, nor do we have the answers to almost anything. Let us get the conversation started, let us share resources, and let us find those solutions together as a community.";
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupHeader() {
        
        let headerImage = UIImage(named: "aboutHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "About", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func aboutChanged(_ sender: Any) {
        switch aboutSegmentedControl.selectedSegmentIndex
        {
        case 0:
            aboutTextView.text = "The Afghan-American diaspora has historically lacked a safe space for candid discussions about the issues most pertinent to us. Traditionally, our community has come together almost exclusively in social settings, including weddings, concerts, picnics, and sports tournaments. However, none of these gatherings have been conducive to serious discussions about the state of our community. Too often, taboo topics have been swept under the proverbial Afghan rug, never to be broached or approached. \n\nGiven the impoverished state of Afghanistan, it is understandable that so much of our diaspora’s civic attention has focused on humanitarian relief for the Motherland. But in doing so, we have lost sight of our own community's struggles here in the United States. \n\nA WAY FORWARD \n\nThis is where the Afghan-American Conference comes into the picture. AAC provides a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, and activating change from within the community. We won’t be able to address everything, nor do we have the answers to almost anything. Let us get the conversation started, let us share resources, and let us find those solutions together as a community.";
            self.aboutTextView.setContentOffset(.zero, animated: false)

        case 1:
            aboutTextView.text = "The Afghan-American Conference is an annual nationwide conference for young community leaders to engage in meaningful dialogue, grow professionally and build relationships. The conference is equal parts professional, cultural, spiritual, social, and personal. It is a holistic event consisting of keynote speeches, professional panels, skill-building workshops, roundtable discussions, safe space caucuses, town halls, networking mixers, entertainment, and even S.E.E.D. Talks. \n\nOUR MISSION \n\nTo provide a forum to address issues affecting the Afghan-American community, and a platform to facilitate dialogue, collaborate, and build relationships to strengthen our diaspora. \n\nOUR VISION \n\nAn empowered, supportive, and engaged Afghan-American community.";
            self.aboutTextView.setContentOffset(.zero, animated: false)

        default:
            break
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
