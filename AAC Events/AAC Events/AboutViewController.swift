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
	
	let boldFont = UIFont(name: "Montserrat-SemiBold", size: 16)
	let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
    let descboldFont = UIFont(name: "Montserrat-Medium", size: 15)
	

    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    var api: API!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setupHeader()
        
        api = API()
        api.retrieveAgenda()
        
        api.retrievePeople { (_) in
            //gets saved in appD
        }
        

        
        self.aboutSegmentedControl.selectedSegmentIndex = 0
        aboutTextView.attributedText = getOurMission() //"The Afghan-American diaspora has historically lacked a safe space for candid discussions about the issues most pertinent to us. Traditionally, our community has come together almost exclusively in social settings, including weddings, concerts, picnics, and sports tournaments. However, none of these gatherings have been conducive to serious discussions about the state of our community. Too often, taboo topics have been swept under the proverbial Afghan rug, never to be broached or approached. \n\nGiven the impoverished state of Afghanistan, it is understandable that so much of our diaspora’s civic attention has focused on humanitarian relief for the Motherland. But in doing so, we have lost sight of our own community's struggles here in the United States. \n\nA WAY FORWARD \n\nThis is where the Afghan-American Conference comes into the picture. AAC provides a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, and activating change from within the community. We won’t be able to address everything, nor do we have the answers to almost anything. Let us get the conversation started, let us share resources, and let us find those solutions together as a community.";
        

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            aboutTextView.setContentOffset(CGPoint.zero, animated: false)

            scrolledOnce = true
        }
    }
    
    
	func getOurMission() -> NSAttributedString {
		let boldAttributes = [NSAttributedStringKey.font: boldFont]
		let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        let descboldAttributes = [NSAttributedStringKey.font: descboldFont]

		
		let runningDescAttrString = NSMutableAttributedString()
		
        
        runningDescAttrString.append(NSAttributedString(string: "AACO’s mission is to advance the Afghan-American community through education and outreach, and to promote civic and social engagement. The Afghan-American Conference (AAC) provides a forum to address issues affecting the Afghan-American community, and a platform to facilitate dialogue, collaborate, and build relationships to strengthen our diaspora.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
		
        runningDescAttrString.append(NSAttributedString(string: "Vision", attributes: boldAttributes as [NSAttributedStringKey : Any]))
		
        runningDescAttrString.append(NSAttributedString(string: "\n\nAn ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))

        runningDescAttrString.append(NSAttributedString(string: "empowered, supportive,", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " and", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " engaged", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " Afghan-American community.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nHistory", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nIn 2014, eight Afghan-Americans pioneered what the diaspora lacked for years -  a safe space for candid discussions about the issues most pertinent to us. Historically, our community came together almost exclusively in social settings, including weddings, concerts, picnics, and sports tournaments. However, none of these gatherings have been conducive to serious discussions about the state of our community. Too often, taboo topics have been swept under the proverbial Afghan rug, never approached.\n\nIn early 2015, the inaugural Afghan-American Conference (AAC) was held at the University of California, Berkeley.  AAC provided a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, sharing resources, and activating change from within the community. What was intended to be a one-time conference, turned into an annual event, with annual conferences being held from 2015 to 2019, a virtual conference held in 2021, and plans for future conferences post-pandemic.\n\nThe discussions, connections, and solutions surfacing from AAC further amplified the need for something bigger. In 2019, the organization once known as AAC transitioned to the Afghan-American Community Organization (AACO), a 501(c)(3) nonprofit, dedicated to advancing the Afghan-American community through education and outreach, and to promoting civic and social engagement.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nCore Values", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\n - Inclusivity: build a sense of community by respecting and valuing the diversity of the Afghan-American community, creating a safe space to learn and grow, and vow to amplify marginalized voices.\n\n - Excellence: lift up our community to excel in personal, academic, and professional development, and promote access to opportunity and prosperity.\n\n - Engagement: be active participants in the American political and social landscape, and advocate for causes that are important to our community.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nA Way Forward", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThis is where the Afghan-American Conference comes into the picture. AAC provides a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, and activating change from within the community. We won’t be able to address everything, nor do we have the answers to almost anything. Let us get the conversation started, let us share resources, and let us find those solutions together as a community.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
			
		return runningDescAttrString
		

	}
	
	func getOurCommittment() -> NSAttributedString {
		let boldAttributes = [NSAttributedStringKey.font: boldFont]
		let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        
        
        let codeofconductAttributes = [
            NSAttributedStringKey.link: URL(string: "http://aa-co.org/s/Code-of-Conduct.pdf")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ] as [NSAttributedStringKey : Any]

        
        let runningCommittmentAttrString = NSMutableAttributedString()

        
        runningCommittmentAttrString.append(NSAttributedString(string: "The Afghan-American Community Organization (AACO) is committed to upholding an inclusive and safe environment for all of our participants across all of our programs and platforms and AAC is no exception to this commitment.\n\nIf you have any questions, please do not hesitate to contact us.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nDiversity", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nDiversity is essential to our work at AACO. We know our Motherland, and our diaspora, are both incredibly diverse, and that diversity itself enriches the experience of attendees and allows for the full rich tapestry of our community to be present and contribute to the conference and organization. We know that to truly succeed, our space should be representative of our diversity as a community. We know we may fall short, but our goal is to strive and aim higher.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
                
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nCode of Conduct", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nThe Afghan-American Community Organization (AACO) is committed to providing a safe and welcoming environment for all its participants. All complaints of discrimination, including harassment, will be taken seriously and handled privately, only informing individuals who need-to-know, through our code of conduct.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "Learn More", attributes: codeofconductAttributes))
        
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
		return runningCommittmentAttrString
	}
    
    func getTheConference() -> NSAttributedString {
        let boldAttributes = [NSAttributedStringKey.font: boldFont]
        let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        

        
        let impactAttributes = [
            NSAttributedStringKey.link: URL(string: "https://aa-co.org/2021-impact-report")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-SemiBold", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ] as [NSAttributedStringKey : Any]
        
        
        let runningConferenceAttrString = NSMutableAttributedString()
        
        
        runningConferenceAttrString.append(NSAttributedString(string: "We are excited to announce that our ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
    
        runningConferenceAttrString.append(NSAttributedString(string: "2021 Annual Impact Report", attributes: impactAttributes))
        
        runningConferenceAttrString.append(NSAttributedString(string: " is now available!\n\nThis report highlights how AACO has helped the Afghan community both here and back home. We have accomplished so much this past year and encourage you to help us maintain this momentum through 2022 by participating in our fundraiser.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        

        
        return runningConferenceAttrString
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
            aboutTextView.attributedText = getOurMission()
            self.aboutTextView.setContentOffset(.zero, animated: false)

        case 1:
            aboutTextView.attributedText = getOurCommittment()
            self.aboutTextView.setContentOffset(.zero, animated: false)
            
        case 2:
            aboutTextView.attributedText = getTheConference()
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
