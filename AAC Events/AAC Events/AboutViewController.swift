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
		
        
        runningDescAttrString.append(NSAttributedString(string: "To provide a forum to address issues affecting the Afghan-American community, and a platform to facilitate dialogue, collaborate, and build relationships to strengthen our diaspora. \n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
		
        runningDescAttrString.append(NSAttributedString(string: "OUR VISION", attributes: boldAttributes as [NSAttributedStringKey : Any]))
		
        runningDescAttrString.append(NSAttributedString(string: "\n\nAn ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))

        runningDescAttrString.append(NSAttributedString(string: "empowered, supportive,", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " and", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " engaged", attributes: descboldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: " Afghan-American community.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOUR REASON", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThe Afghan-American diaspora has historically lacked a safe space for candid discussions about the issues most pertinent to us. Traditionally, our community has come together almost exclusively in social settings, including weddings, concerts, picnics, and sports tournaments. However, none of these gatherings have been conducive to serious discussions about the state of our community. Too often, taboo topics have been swept under the proverbial Afghan rug, never to be broached or approached.\n\nGiven the impoverished state of Afghanistan, it is understandable that so much of our diaspora’s civic attention has focused on humanitarian relief for the Motherland. But in doing so, we have lost sight of our own community's struggles here in the United States. Almost every Afghan family landed in the U.S. as refugees with few resources, but many are still trapped in the same socioeconomic class. According to the “Bay Area Muslim Study” by Drs. Farid Senzai and Hatem Bazian, Afghans have the fewest households making over $100,000 among any Muslim group in the San Francisco Bay Area. We are also the least educated group, with less than half of our community having pursued higher education. The fact that we only have statistics on Bay Area Afghans, and only in relation to other Muslim ethnicities, speaks to our underrepresented status nationwide—and just how much work we have to do as a community to move forward.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nOUR CORE VALUES", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\n• Build a sense of community around a diverse Afghan-American identity, while learning and embracing Afghan culture and history. \n• Provide a space for networks built on professional and academic connections for guidance, career growth, and development of leadership skills.\n• Engage in critical dialogue around challenging issues and activate the change to find solutions in our community.\n• Internalize norms and values that demonstrate respect, accountability, and flexibility towards different perspectives.  ", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nA WAY FORWARD", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningDescAttrString.append(NSAttributedString(string: "\n\nThis is where the Afghan-American Conference comes into the picture. AAC provides a forum for our community to address these difficult topics in a respectful, forward-thinking manner. It is a grassroots effort at shedding light on these pressing issues, inspiring action, and activating change from within the community. We won’t be able to address everything, nor do we have the answers to almost anything. Let us get the conversation started, let us share resources, and let us find those solutions together as a community.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
			
		return runningDescAttrString
		

	}
	
	func getOurCommittment() -> NSAttributedString {
		let boldAttributes = [NSAttributedStringKey.font: boldFont]
		let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
        
        
        let diveristyAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.afghanamericanconference.org/diversity-1")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 15)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ] as [NSAttributedStringKey : Any]
        
        let mentalwellnessAttributes = [
            NSAttributedStringKey.link: URL(string: "https://www.afghanamericanconference.org/mental-health")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ] as [NSAttributedStringKey : Any]
        
        let harrassmentAttributes = [
            NSAttributedStringKey.link: URL(string: "https://static1.squarespace.com/static/56a2ec72cbced637fea96241/t/5cbb5ac1ee6eb039cef2a133/1555782338165/AACO+Code+of+Conduct.pdf")!,
            NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ] as [NSAttributedStringKey : Any]

        
        let runningCommittmentAttrString = NSMutableAttributedString()

        
        runningCommittmentAttrString.append(NSAttributedString(string: "The Afghan-American Conference commits to keeping our conference an inclusive and safe environment for all of our participants.\n\nIf you have any questions, please do not hesitate to contact us.", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nDIVERSITY", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nDiversity is essential to our work at AAC. We know our Motherland, and our diaspora, are both incredibly diverse, and that diversity itself enriches the experience of attendees and allows for the full rich tapestry of our community to be present and contributing to the conference and organization. We know that to truly succeed, our space should be representative of our diversity as a community. We know we may fall short, but our goal is to strive and aim higher.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "Learn More", attributes: diveristyAttributes))
        
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nMENTAL WELLNESS", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nOne of the recurring themes that arise during the weekend of our conference is mental health. The importance of mental health is often threaded through our keynotes, S.E.E.D. Talks, sessions, and panels. \n\nAs our community bands together to move forward, one stigmatized yet present challenge is maintaining mental wellness both for our loved ones and us.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "Learn More", attributes: mentalwellnessAttributes))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nCODE OF CONDUCT", attributes: boldAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "\n\nThe Afghan-American Community Organization (AACO) is committed to providing a safe and welcoming environment for all its participants. All complaints of discrimination, including harassment, will be taken seriously and handled privately, only informing individuals that need-to-know, through our code of conduct.\n\n", attributes: descriptionAttributes as [NSAttributedStringKey : Any]))
        
        runningCommittmentAttrString.append(NSAttributedString(string: "Learn More", attributes: harrassmentAttributes))
        
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
