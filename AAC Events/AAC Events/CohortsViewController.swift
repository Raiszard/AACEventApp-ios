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
    
    var api: API!

    var cohorts: [Cohort] = []
    
//    var cohortTitles: [String] = ["Cohort 0", "Cohort 2", "Cohort 3", "Cohort 4", "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9", "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14", "Cohort 15", "Cohort 16","Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"]
    
    var evaulationLink = "www.goggle.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHeader()
        
        api = API()
        
        getCohorts()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupHeader() {
        
        let headerImage = UIImage(named: "cohortHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Cohorts", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
    
    func getCohorts() {
        api.retrieveCohorts { (apiCohorts, evalLink) in
            if apiCohorts != nil {
                self.cohorts = apiCohorts!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            if evalLink != nil {
                self.evaulationLink = evalLink!
            }
        }
    }
    
}
extension CohortsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //TODO: use cohorts data model instead of hard coding
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cohorts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cohorts[section].peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cohorts[section].title
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let screenWidth = tableView.frame.width
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
//        let line = UIView(frame: CGRect(x: 20, y: 49, width: screenWidth - 40, height: 1))
//        line.backgroundColor = .gray

        
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        let title = cohorts[section].title
        label.text = title
        label.backgroundColor = .white
        return label
        
//        view.addSubview(line)
//        view.addSubview(label)
//
//        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cohortCell", for: indexPath) as? CohortTableViewCell else {
            return UITableViewCell()
        }
        
        let cohort = cohorts[indexPath.section]
        let person = cohort.peopleArray[indexPath.row]
        
        cell.label?.text = person.name
        
        cell.profileImage?.contentMode = .scaleAspectFill
        
        cell.profileImage?.layer.cornerRadius = 42/2
        
        if person.imageName != nil {
            if let image = UIImage(named: person.imageName) {
                cell.profileImage.image = image
            }
        } else if let personImgURL = URL(string: person.imageURL) {
            cell.profileImage?.sd_setImage(with: personImgURL, completed: { (image, error, cacheType, url) in
                if error == nil {
                    cell.profileImage?.image = image
                    cell.clipsToBounds = true
                    cell.setNeedsLayout()
                }
            })
        } else {
            let image = UIImage(named: "noImage")
            cell.profileImage.image = image
        }
        cell.clipsToBounds = true
        cell.setNeedsLayout()
        cell.profileImage.clipsToBounds = true

        
        return cell
    }
}
