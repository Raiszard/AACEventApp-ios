//
//  AgendaViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class AgendaViewController: UIViewController {

    @IBOutlet weak var daysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var selectedBarCenterOffsetConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    
    var allAgendaItems: [AgendaItem] = []
    var visableAgendaItems: [AgendaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        daysSegmentedControl.backgroundColor = .clear
        daysSegmentedControl.tintColor = .clear
        
        let attributes: [NSAttributedStringKey: Any] = [ NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
        
//        tableView.register(SessionTableViewCell.self, forCellReuseIdentifier: "sessionCell")
//        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")// CustomTableViewCell.self, forCellReuseIdentifier: "customCell")

        let cellnib = UINib(nibName: "SessionTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "sessionCell")
        //go through the session arrays and create an array of items with a visable tag
        
        
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
        item2.isExpanded = true
        allAgendaItems.append(item2)

        let item3 = AgendaItem()
        item3.timeString = ""
        item3.amOrPm = ""
        item3.sessionName = "Session 3 name will go here"
        item3.sessionDescription = "this is description as well"
        item3.id = "3"
        item3.subItems = []
        item3.isExpandable = false
        item3.isVisable = false
        item3.isExpanded = false
        allAgendaItems.append(item3)

        let item4 = AgendaItem()
        item4.timeString = "5 - 7"
        item4.amOrPm = "pm"
        item4.sessionName = "Session 4 name will go here"
        item4.sessionDescription = "this is another description"
        item4.id = "4"
        item4.subItems = []
        item4.isExpandable = false
        item4.isVisable = false
        item4.isExpanded = false
        allAgendaItems.append(item4)
        
        visableAgendaItems.append(item1)
        visableAgendaItems.append(item2)

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.selectedBarCenterOffsetConstraint.constant = offset

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

extension AgendaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.visableAgendaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let currentItem = visableAgendaItems[indexPath.row]
        
        cell.timeLabel.text = currentItem.timeString
        cell.amPMLabel.text = currentItem.amOrPm
        cell.sessionNameLabel.text = currentItem.sessionName
        cell.sessionDescriptionLabel.text = currentItem.sessionDescription
        
        var imageToUse = ""
        if currentItem.isExpandable {
            if currentItem.isExpanded {
                imageToUse = "downArrow"
            } else  {
                imageToUse = "rightArrow"
            }
            imageToUse = "ic_tabbar_playful"
        } else {
//            imageToUse = "circlePlus"
            imageToUse = "ic_tabbar_serious"

        }
        cell.disclosureButton.setImage(UIImage(named: imageToUse), for: .normal)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentItem = visableAgendaItems[indexPath.row]
        
        if currentItem.isExpandable {
            if currentItem.isExpanded {
                var numberOfItemsToRemove = currentItem.subItems.count
                while numberOfItemsToRemove > 0 {
                    visableAgendaItems.remove(at: indexPath.row + 1)
                    numberOfItemsToRemove -= 1
                }
                currentItem.isExpanded = false
                
            } else {
                //TODO: add items to visable array
            }
        }
    }
}

class AgendaItem: NSObject {
    
    var timeString: String?
    var amOrPm: String?
    var sessionName: String!
    var sessionDescription: String!
    var id: String!
    var subItems:[String]!
    
    var isVisable = false
    var isExpandable = false
    
    var isExpanded = false

}
