//
//  PersonDetailsViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/6/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var sessionIDs: [String] = []
    var personTitle: String! = "Title of the person"
    var name: String! = "Name goes here"
    var personDescription: String! = ""
    var imageURL: String! = ""
    
    var testAgendaItem: Session!

    var personsSessions: [[Session]] = [[],[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellnib = UINib(nibName: "SessionTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "sessionCell")
        
        if self.imageURL != nil {
            let url = URL(string: imageURL)
            self.personImageView.sd_setImage(with: url, completed: { (image, error, _, _) in
                if error == nil {
                    self.personImageView.image = image
                }
            })
        }
        
        setupHeader()
        
        setupPersonsSessions()
        
        //test agenda item
//        let item1 = AgendaItem()
//        item1.startTime = "1-3"
//        item1.endTime = "pm"
//        item1.sessionName = "Session name will go here"
//        item1.location = "this is the description"
//        item1.id = "1"
//        item1.subItems = []
//        item1.isExpandable = false
//        item1.isExpanded = false
//        testAgendaItem = item1
        
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 9999999))
        label.text = self.personDescription
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Book", size: 15)
        label.sizeToFit()
        label.frame.size.height = label.frame.height + 20 //more padding for description
        tableView.tableHeaderView = label
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        personImageView.layer.cornerRadius = 120/2
        personImageView.clipsToBounds = true

        tableView.reloadData()
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "profileHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: name, subtitle:personTitle, imageURL: nil, image: headerImage, isProfile: true)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    func setupPersonsSessions() {
        let appD = UIApplication.shared.delegate as! AppDelegate
        
        for id in sessionIDs {
            let (foundItem, day) = appD.allSessions.findSessionForID(searchID: id)
            if foundItem != nil {
                personsSessions[day!].append(foundItem!)
            }
        }
        self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var hasFri = false
    var hasSat = false
    var hasSun = false
    var sectionTitles:[String] = []
}

extension PersonDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        sectionTitles = []
        if personsSessions[0].count > 0 {
            count += 1
            hasFri = true
            sectionTitles.append("Friday Sessions")
        }
        if personsSessions[1].count > 0 {
            count += 1
            hasSat = true
            sectionTitles.append("Saturday Sessions")

        }
        if personsSessions[2].count > 0 {
            count += 1
            hasSun = true
            sectionTitles.append("Sunday Sessions")

        }
        return count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if personsSessions != nil {
            return personsSessions[section].count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let currentItem = personsSessions[indexPath.section][indexPath.row]
        
        cell.shouldShowTime = true
        cell.disclosureButton.isHidden = true
        cell.agendaItem = currentItem
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SessionDetails") as? SessionDetailsViewController else { return }
        
        vc.agendaItem = personsSessions[indexPath.section][indexPath.row]
        present(vc, animated: true, completion: nil)

    }

}

extension PersonDetailsViewController: SessionCellDelegate {
    
    func didPressDisclosureButton(cell: SessionTableViewCell) {
        return
    }
}




