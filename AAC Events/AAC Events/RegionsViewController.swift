//
//  RegionsViewController.swift
//  AAC Events
//
//  Created by Omar Noorzay on 5/28/23.
//  Copyright © 2023 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class RegionsViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
        
    }
    
    let regionsArray: [String] = ["DMV", "NorCal", "SoCal", "Tristate"]
    var imageArray: [UIImage] = [
        UIImage(named: "dmv")!,
        UIImage(named: "norcal")!,
        UIImage(named: "socal")!,
        UIImage(named: "tristate")!
    ]
    var headerImageArray: [UIImage] = [
        UIImage(named: "aaconnectHeader")!,
        UIImage(named: "spotlightHeader")!,
        UIImage(named: "newsletterHeader")!,
        UIImage(named: "sponsorHeader")!
    ]
    
    let regionDescriptionArray: [String] = ["AACO’s DMV Region encompasses anyone that identifies with, is from or is currently living in the District of Columbia, the states of Maryland and Virginia.\n\n2023 Past Events:\n\n - March: Kick-Off Event\n - April: Community Iftar\n\n2023 Future Events:\n\n - July/August: Regional Reunion\n\nYou don’t want to miss out on the official post-conference regional reunion, this annual event is for all of our alumni to come together with food, games, and fun!\n\nWe are in the process of potentially planning another yearly regional event, make sure to check back here for updates regarding all regional events in the DMV!",
                                            
        "AACO’s NorCal Region encompasses anyone that identifies with, is from or is currently living in the San Francisco Bay Area, Greater Sacramento Area, Metropolitan Fresno Area and any other area in the northern portion of the state of California.\n\n2023 Past Events:\n\n - March: Kick-Off Event\n - April: Community Iftar\n\n2023 Future Events:\n\n - July/August: Regional Reunion\n\nYou don’t want to miss out on the official post-conference regional reunion, this annual event is for all of our alumni to come together with food, games, and fun!\n\nWe are in the process of potentially planning another yearly regional event, make sure to check back here for updates regarding all regional events in NorCal!",
    
        "AACO’s SoCal Region encompasses anyone that identifies with, is from or is currently living in the Los Angeles Metropolitan Area, Inland Empire, San Diego Metropolitan Area and any other area in the southern portion of the state of California.\n\n2023 Past Events:\n\n - March: Kick-Off Event\n - April: Community Iftar\n\n2023 Future Events:\n\n - July/August: Regional Reunion\n\nYou don’t want to miss out on the official post-conference regional reunion, this annual event is for all of our alumni to come together with food, games, and fun!\n\nWe are in the process of potentially planning another yearly regional event, make sure to check back here for updates regarding all regional events in SoCal!",
    
        "AACO’s TriState Region encompasses anyone that identifies with, is from or is currently living in states of New York, New Jersey, Connecticut and Eastern Pennsylvania.\n\n2023 Past Events\n\n - March: Kick-Off Event\n - April: Community Iftar\n\n2023 Future Events:\n\n - July/August: Regional Reunion\n\nYou don’t want to miss out on the official post-conference regional reunion, this annual event is for all of our alumni to come together with food, games, and fun!\n\nWe are in the process of potentially planning another yearly regional event, make sure to check back here for updates regarding all regional events in the TriState!"]
    
    
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
        
        let hView = header.createHeader(title: "AACO Regions", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



extension RegionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "regionsCell") as? RegionsTableViewCell else {
            return UITableViewCell()
        }
        
        var initiative: String = ""
        //let image : UIImage
        
        
        
        var iconImage : UIImage = UIImage(named: "aaconnect")!
        //var image: UI = ""
        
        if indexPath.section == 0 {
            initiative = regionsArray[indexPath.row]
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
        let destination = storyboard.instantiateViewController(withIdentifier: "RegionsDetails") as! RegionsDetailsViewController
        
        var initiative: String = ""
        var description: String = ""
        var initiativeHeader : UIImage = UIImage(named: "aaconnectHeader")!
        
        
        
        //var descp: String = ""
        
        if indexPath.section == 0 {
            initiative = regionsArray[indexPath.row]
            description = regionDescriptionArray[indexPath.row]
            initiativeHeader = headerImageArray[indexPath.row]
            
        }
        
        destination.regionsName = initiative
        destination.regionsDescription = description
        destination.mainHeaderImage = initiativeHeader
        
        destination.modalPresentationStyle = .fullScreen
        
        present(destination, animated: true, completion: nil)
        
    }
    
}


class RegionsTableViewCell: UITableViewCell {
    
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

