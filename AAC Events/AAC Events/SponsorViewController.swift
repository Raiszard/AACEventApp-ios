//
//  SponsorViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class SponsorViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var allSponsors: AllSponsors!
    var api: API!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()

        api = API()
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        api.retrieveSponsors { (newSponsors) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.allSponsors = newSponsors
                self.tableView.reloadData()
            }
        }
        
        let cellnib = UINib(nibName: "ImageLabelTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "imageLabelCell")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "sponsorHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Sponsors & Scholarships", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SponsorViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if allSponsors == nil { return 0 }
        return allSponsors.allLevelSponsors.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSponsors.allLevelSponsors[section].sponsors.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allSponsors.allLevelSponsors[section].level
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 30))
        label.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        let title = allSponsors.allLevelSponsors[section].level
        label.text = title
        label.backgroundColor = .white
        return label
    
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageLabelCell", for: indexPath) as? ImageLabelTableViewCell else {
            return UITableViewCell()
        }
        
        let sponsor = allSponsors.allLevelSponsors[indexPath.section].sponsors[indexPath.row]
        cell.label?.font = UIFont(name: "Montserrat-Regular", size: 15)
        cell.label?.backgroundColor = .white
        cell.label?.text = sponsor.name
        cell.logoImageView?.layer.cornerRadius = 44/2
        cell.logoImageView?.contentMode = .scaleAspectFill
        cell.logoImageView.clipsToBounds = true
        cell.logoImageView.image = nil
        
        if !sponsor.imageName.isEmpty {
            if let image = UIImage(named: sponsor.imageName) {
                cell.logoImageView.image = image
            }
        } else if let sponsorLogo = URL(string: sponsor.logoImageURL) {
            cell.logoImageView?.sd_setImage(with: sponsorLogo, completed: { (image, error, cacheType, url) in
                if error == nil {
                    cell.logoImageView?.image = image
                    cell.clipsToBounds = true
                    cell.setNeedsLayout()
                }
            })
        } else {
            let image = UIImage(named: "sponsorNoImage")
            cell.logoImageView.image = image
        }
        

        return cell
    }
}
