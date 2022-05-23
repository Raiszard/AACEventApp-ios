//
//  AttendeesViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/7/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class AttendeesViewController: UIViewController,SideMenuItemContent {

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var api: API!
    
    var attendees: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeader()
        api = API()
        
        downloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "attendeesHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Conference Ambassadors", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }

    func downloadData() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        api.retrieveAttendees { (ateendessList) in
            guard let check = ateendessList else {
                print("error downloading attendees")
                //TODO: show alert
                return
                
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.attendees = check
                self.tableView.reloadData()
            }
            
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

extension AttendeesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendees.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "attendee") as? AttendeeTableViewCell else {
            return UITableViewCell()
        }
        let currentName = attendees[indexPath.row]
        
        
        var confambArray: [UIImage] = [
            UIImage(named: "ali_saadat")!,
            UIImage(named: "ciere_said")!,
            UIImage(named: "hanna_kherzai")!,
            UIImage(named: "jahed_aziz")!,
            UIImage(named: "mariam_alamyar")!,
            UIImage(named: "mariam_azimi")!,
            UIImage(named: "mariam_mahbob")!,
            UIImage(named: "maryam_aziz")!,
            UIImage(named: "munija_ramin")!,
            UIImage(named: "pardis_rahimi")!,
            UIImage(named: "parsa_mujadedy")!,
            UIImage(named: "shabnum_hamidi")!,
            UIImage(named: "tamana_noory")!,
            UIImage(named: "yoseph_raja")!
        
        ]
        
    
        
        cell.confambImage?.contentMode = .scaleAspectFill
        
        cell.confambImage?.layer.cornerRadius = 44/2
        cell.clipsToBounds = true
        cell.setNeedsLayout()
        cell.confambImage.clipsToBounds = true
      
        
        
       // cell.initialsLabel.text = initials
        cell.nameLabel.text = currentName
        
        cell.confambImage?.image = confambArray[indexPath.row]
        
        
        cell.confambImage.layer.cornerRadius = cell.confambImage.frame.width/2

        
        //cell.initialsLabel.layer.cornerRadius = cell.initialsLabel.frame.width/2
        return cell
    }
}



