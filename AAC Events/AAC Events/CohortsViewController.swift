//
//  CohortsViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/8/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class CohortsViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var headerContainer: UIView!
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    @IBOutlet weak var tableView: UITableView!
    
    var cohortTitles: [String] = ["Cohort 0", "Cohort 2", "Cohort 3", "Cohort 4", "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9", "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14", "Cohort 15", "Cohort 16","Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"]
    
    var evaulationLink = "www.goggle.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHeader()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupHeader() {
        
        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Cohorts", subtitle:nil, imageURL: nil, image: nil, isProfile: false)
        
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
    @IBAction func evauluationPressed(_ sender: Any) {
        if let url = URL(string: evaulationLink) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
extension CohortsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //TODO: use cohorts data model instead of hard coding
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cohortTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cohortTitles[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cohortCell", for: indexPath)
        
//        let cohortItem = cohorts[indexPath.section][indexPath.row]
//        cell.imageView?.sd_setImage(with: cohortItem.imageURL, completed: nil)
//        cell.textLabel?.text = cohortItem.name

        cell.textLabel?.text = "Person " + String(indexPath.row) + " name in cohort #: " + String(indexPath.section + 1)
        
        return cell
    }
}
