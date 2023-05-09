//
//  InitiativesViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/27/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class InitiativesViewController: UIViewController, SideMenuItemContent {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
        
    }
    @IBOutlet weak var headerContainer: UIView!
    let initiativesArray: [String] = ["AAConnect", "Community Spotlight", "Newsletter", "Scholarships"]
    var imageArray: [UIImage] = [
        UIImage(named: "aaconnect")!,
        UIImage(named: "spotlight")!,
        UIImage(named: "newsletter")!,
        UIImage(named: "scholarship")!
    ]
    var headerImageArray: [UIImage] = [
        UIImage(named: "aaconnectHeader")!,
        UIImage(named: "spotlightHeader")!,
        UIImage(named: "newsletterHeader")!,
        UIImage(named: "sponsorHeader")!
    ]
    
    let initiativeDescriptionArray: [String] = ["WHAT IS AACONNECT?\n\nAAConnect is a national network and resource base of 1000+ Afghan-American students and professionals who seek to build professional relationships and provide resources for their community.\n\nWHO CAN JOIN AACONNECT?\n\nAny individual who identifies as Afghan-American and who has an email address. Please note that all attendees of AAC will automatically be added to the listserv.\n\nHOW DO I USE THE AACONNECT LISTSERV?\n\nUsing AAConnect is as simple as three steps (once a member of the listserv):\n\n1. Send your resources/inquiries via email to aaconnect@googlegroups.com\n\n2. Admin approval of email in 24-48 hours\n\n3. Watch the responses roll through!\n\nADDITIONAL QUESTIONS?\n\nPlease feel free to email operations@aa-co.org with any additional questions.", "Do you know a member of the Afghan-American community who deserves some special recognition? Click the button below to nominate them for next month's feature!\n\n https://docs.google.com/forms/d/e/1FAIpQLSd42mueCymiQrIbC1cUhU0P8oK5oWw_mOef4KhGAxrprREw0A/viewform","The official AACO newsletter is your one-stop source for staying in touch with all things AACO post-Conference weekend! The monthly newsletter covers various topics such as program announcements (i.e., scholarships, future AACs, internship programs, etc.), community spotlight features, AACO partnerships, miscellaneous community resources, recommended articles, and much more! All AAC attendees are added to the newsletter and are welcome to opt out whenever (though we will miss you!)","Established in 2018 in close collaboration with generous members of the community, the Afghan-American Community Organization Scholarship Program supports undergraduate, graduate, and vocational Afghan-American students committed to the betterment of the Afghan-American community and who demonstrate financial need. Six  years since its inception, AACO has awarded nearly $250,000 to 46 recipients across the U.S. AACO strives to continue empowering the next generation of Afghan-American leaders.\n\nApplications for the sixth annual Afghan-American Community Organization Scholarship program recently closed. Stay tuned for next year’s scholarship application announcement."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupHeader()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupHeader() {
        
        let headerImage = UIImage(named: "initiativesHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Programs", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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


extension InitiativesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0){
            return 4
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "initiativesCell") as? InitiativesTableViewCell else {
            return UITableViewCell()
        }
        
        var initiative: String = ""
        //let image : UIImage
        
        
        
        var iconImage : UIImage = UIImage(named: "aaconnect")!
        //var image: UI = ""
        
        if indexPath.section == 0 {
            initiative = initiativesArray[indexPath.row]
            iconImage =
            imageArray[indexPath.row]
        }
        
        cell.profileImage.image = iconImage
        cell.label.text = initiative
        //cell.profileImage = image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //if indexPath.section == 0 { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "InitiativeDetails") as! InitiativeDetailsViewController
        
        var initiative: String = ""
        var description: String = ""
        var initiativeHeader : UIImage = UIImage(named: "aaconnectHeader")!
        
        
        
        //var descp: String = ""
        
        if indexPath.section == 0 {
            initiative = initiativesArray[indexPath.row]
            description = initiativeDescriptionArray[indexPath.row]
            initiativeHeader = headerImageArray[indexPath.row]
            
        }
        
        destination.initiativeName = initiative
        destination.initiativeDescription = description
        destination.mainHeaderImage = initiativeHeader
        
        destination.modalPresentationStyle = .fullScreen
        
        present(destination, animated: true, completion: nil)
        
    }
    
}


class InitiativesTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
