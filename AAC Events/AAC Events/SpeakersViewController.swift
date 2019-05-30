//
//  SpeakersViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/6/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class SpeakersViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var peopleLists: [PeopleList]!
    
    var currentSegment = 0
    
    var api: API!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = API()
        
        api.retrievePeople { (peeps) in
            if peeps != nil {
                self.peopleLists = peeps!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        setupHeader()
        // Do any additional setup after loading the view.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "speakerHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Speakers & Performers", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        self.currentSegment = sender.selectedSegmentIndex
        self.tableView.reloadData()
    }
    
//    @IBAction func segmentChanged(_ sender: Any) {
//
//        self.tableView.reloadData()
//    }
    @IBAction func openMenu(_ sender: UIButton) {
        
        showSideMenu()

//        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
//            menuItemViewController.showSideMenu()
//        }
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

extension SpeakersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if peopleLists != nil {
            let peoplelist = peopleLists[currentSegment]
            if peoplelist != nil {
                return peoplelist.peopleArray.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonTableViewCell else {
            return UITableViewCell()
        }
        let peopleList = peopleLists[currentSegment]
        let person = peopleList.peopleArray[indexPath.row]
        
        cell.nameLabel.text = person.name
        
        cell.personImageView.layer.cornerRadius = 44/2
        
        if let image = UIImage(named: person.imageName) {
            cell.personImageView?.image = image

        }else if let url = URL(string: person.imageURL){
            cell.personImageView?.sd_setImage(with: url, completed: { (image, error, _, returnURL) in
                if error == nil {
                    cell.personImageView?.image = image
                    cell.personImageView?.clipsToBounds = true
                    //                    cell.profileImage?.layer.cornerRadius = (cell.imageView?.frame.size.width)!/4
                    cell.setNeedsLayout()
                    
                }
            })
        } else {
            cell.personImageView?.image = UIImage(named: "noImage")
        }
        cell.personImageView?.clipsToBounds = true

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PersonDetails") as? PersonDetailsViewController else { return }
        
        vc.person = self.peopleLists[currentSegment].peopleArray[indexPath.row]
        
        
        present(vc, animated: true, completion: nil)

        
    }
}




