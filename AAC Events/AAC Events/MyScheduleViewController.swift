//
//  MyScheduleViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/5/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MyScheduleViewController: UIViewController {

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var daysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var allAgendaItems: [AgendaItem] = []
    
    var enrolledAgendaItems: [AgendaItem] = []

    @IBOutlet weak var selectedBarCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        daysSegmentedControl.backgroundColor = .clear
        daysSegmentedControl.tintColor = .clear
        
        let attributes: [NSAttributedStringKey: Any] = [ NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        let cellnib = UINib(nibName: "SessionTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "sessionCell")
        // Do any additional setup after loading the view.
        
        //test data
        let item1 = AgendaItem()
        item1.timeString = "1-3"
        item1.amOrPm = "pm"
        item1.sessionName = "Session name will go here"
        item1.sessionDescription = "this is the description"
        item1.id = "1"
        item1.subItems = []
        item1.isExpandable = false
        item1.isVisable = true
        item1.isExpanded = false
        
        allAgendaItems.append(item1)
        
        let item2 = AgendaItem()
        item2.timeString = "3-4"
        item2.amOrPm = "pm"
        item2.sessionName = "Roundtable Discussions"
        item2.sessionDescription = "Various"
        item2.id = "2"
        item2.subItems = ["3", "4"]
        item2.isExpandable = true
        item2.isVisable = true
        item2.isExpanded = false
        allAgendaItems.append(item2)
        
        let item3 = AgendaItem()
        item3.timeString = "3-4"
        item3.amOrPm = "pm"
        item3.sessionName = "Session 3 name will go here"
        item3.sessionDescription = "this is description as well"
        item3.id = "3"
        item3.subItems = []
        item3.isExpandable = false
        item3.isVisable = false
        item3.isExpanded = false
        allAgendaItems.append(item3)
        
        let item4 = AgendaItem()
        item4.timeString = "3-4"
        item4.amOrPm = "pm"
        item4.sessionName = "Session 4 name will go here"
        item4.sessionDescription = "this is another description"
        item4.id = "4"
        item4.subItems = []
        item4.isExpandable = false
        item4.isVisable = false
        item4.isExpanded = false
        allAgendaItems.append(item4)
        
        let item5 = AgendaItem()
        item5.timeString = "7-8"
        item5.amOrPm = "pm"
        item5.sessionName = "Session 5 name will go here"
        item5.sessionDescription = "this is another description"
        item5.id = "5"
        item5.subItems = []
        item5.isExpandable = false
        item5.isVisable = true
        item5.isExpanded = false
        allAgendaItems.append(item5)
        
        setupHeader()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupEnrolledItems()
        tableView.reloadData()
    }
    
    func setupEnrolledItems() {
        //go through all items and add ones we are enrolled in
        enrolledAgendaItems = []
        var enrolledIDs:[String] = []
        guard let appD = UIApplication.shared.delegate as? AppDelegate else { return }
        enrolledIDs = appD.enrolledSessionIDs
        
        for currentItem in allAgendaItems {
            for currentID in enrolledIDs {
                if currentItem.id == currentID {
                    enrolledAgendaItems.append(currentItem)
                }
            }
        }
        
    
    }
    func setupHeader() {
        
        let headerImage = UIImage(named: "myscheduleHeader")
        let header: ViewHeader = .fromNib()
        
        //TODO: get dates of event from somewhere
        let hView = header.createHeader(title: "My Schedule", subtitle:"March 23-25", imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }
    @IBAction func dayChanged(_ sender: UISegmentedControl) {
        
        let segmentWidth = daysSegmentedControl.frame.width / 3
        
        var offset = CGFloat(0.0)
        switch sender.selectedSegmentIndex {
        case 0:
            offset = (segmentWidth * -1)
        case 1: offset = 0
        case 2: offset = segmentWidth
        default:
            print("SHOULD NEVER SEE THIS")
        }
        self.selectedBarCenterConstraint.constant = offset
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        
        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
            menuItemViewController.showSideMenu()
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

extension MyScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enrolledAgendaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let currentItem = enrolledAgendaItems[indexPath.row]
        cell.agendaItem = currentItem
        cell.delegate = self
        cell.disclosureButton.isHidden = true
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SessionDetails") as? SessionDetailsViewController else { return }
        
        vc.agendaItem = enrolledAgendaItems[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension MyScheduleViewController: SessionCellDelegate {
    func didPressDisclosureButton(cell: SessionTableViewCell) {
        
        return
        
//        guard let cellsItem = cell.agendaItem else {
//            print("wtf?")
//            return
//        }
//        guard let indexPath = self.tableView.indexPath(for: cell) else {
//            print("couldn't find cell")
//            return
//        }
//
//        if cellsItem.isExpandable {
//            self.cellSelected(currentCell: cell, indexPath: indexPath)
//            return
//        }
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let isEnrolled = appDelegate.isEnrolledIn(sessionID: cellsItem.id)
//
//        if isEnrolled {
//            appDelegate.removeSession(sessionID: cellsItem.id)
//        } else {
//            appDelegate.enrollInSession(sessionID: cellsItem.id)
//        }
//
//        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}




