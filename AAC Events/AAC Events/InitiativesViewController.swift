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
      let initiativesArray: [String] = ["AAConnect", "AAC Newsletter"]
    var imageArray: [UIImage] = [
        UIImage(named: "aaconnect")!,
        UIImage(named: "newsletter")!
    ]
    var headerImageArray: [UIImage] = [
        UIImage(named: "aaconnectHeader")!,
        UIImage(named: "newsletterHeader")!
    ]

    let initiativeDescriptionArray: [String] = ["A brainchild of the 2015 Afghan-American Conference, we're very excited to launch AAConnect.\n\nWHAT IS AACONNECT?\n\nAAConnect is an exclusive Afghan-American professional network that aims to provide a platform for members to share resources, advice, career opportunities, and to provide skills-based trainings for its members.\n\nWHAT DOES AACONNECT PROVIDE?\n\nAAConnect members will benefit from:\n\n• A membership base of Afghan professionals from legal, banking, consulting, finance, corporate development, entrepreneurship government, non-profit and other related & similar fields\n\n• Skills-based training events which include podcasts and forums with industry leaders\n\n• Access to a network of global job postings\n\n• Social-networking and mentorship opportunities\n\nHOW IS AACONNECT DIFFERENT FROM AMP?\n\nThe Afghan Mentorship Program (AMP) is a community-driven organization dedicated to helping Afghan youth pursue higher education. AMP connects Afghan-American youth, mostly high school students, to successfully qualified Afghan-American mentors who can provide the advice and guidance they need. AAConnect is focused on catering to Afghan professionals who want to advance their careers.\n\nHOW DO I JOIN AACONNECT?\n\nAll AAC attendees and alumni are automatically enrolled in AAConnect, unless they choose to opt out.", "Already looking to stay connected post-AAC? Sign up for the official Afghan-American Conference newsletter here: http://eepurl.com/cw24IT"]
    
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
        
        let hView = header.createHeader(title: "Initiatives", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
            return 2
        }
        return 2
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
