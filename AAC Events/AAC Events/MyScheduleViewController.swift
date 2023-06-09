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
    
    var enrolledAgendaItems: [[Session]] = [[],[],[]]
    
    var appDelegate: AppDelegate!

    @IBOutlet weak var selectedBarCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        daysSegmentedControl.backgroundColor = .clear
        daysSegmentedControl.tintColor = .clear
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let attributes: [NSAttributedStringKey: Any] = [ NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        let cellnib = UINib(nibName: "SessionTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "sessionCell")
        // Do any additional setup after loading the view.
        
        setupHeader()
        daysSegmentedControl.selectedSegmentIndex = 0
        dayChanged(daysSegmentedControl)

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
        enrolledAgendaItems = [[],[],[]]
        var enrolledIDs:[String] = []
        guard let appD = UIApplication.shared.delegate as? AppDelegate else { return }
        enrolledIDs = appD.enrolledSessionIDs
        
        for currentID in enrolledIDs {
            let (foundItem, day) = appD.allSessions.findSessionForID(searchID: currentID)
            if foundItem != nil {
                enrolledAgendaItems[day!].append(foundItem!)
            }
        }
        
        //sort sessions by start time
        for i in 0...2 {
            enrolledAgendaItems[i].sort(by: { (sesh1, sesh2) -> Bool in
                return sesh1.startDate?.compare(sesh2.startDate!) == .orderedAscending
            })
        }
    }
    func setupHeader() {
        
        let headerImage = UIImage(named: "myscheduleHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "My Schedule", subtitle:"June 23 - 25", imageURL: nil, image: headerImage, isProfile: false)
        
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
        
        self.tableView.reloadData()
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        
        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
            menuItemViewController.showSideMenu()
        }
    }
}

extension MyScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enrolledAgendaItems[daysSegmentedControl.selectedSegmentIndex].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let currentItem = enrolledAgendaItems[daysSegmentedControl.selectedSegmentIndex][indexPath.row]
        cell.shouldShowTime = true
        cell.agendaItem = currentItem
        cell.delegate = self
        cell.disclosureButton.isHidden = true
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SessionDetails") as? SessionDetailsViewController else { return }
        vc.modalPresentationStyle = .fullScreen

        vc.agendaItem = enrolledAgendaItems[daysSegmentedControl.selectedSegmentIndex][indexPath.row]

        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension MyScheduleViewController: SessionCellDelegate {
    func didPressDisclosureButton(cell: SessionTableViewCell) {
        
        return
    }
}




