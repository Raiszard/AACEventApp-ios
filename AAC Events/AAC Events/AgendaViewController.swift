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

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var daysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var selectedBarCenterOffsetConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    
    var allAgendaItems: [[Session]] = [[],[],[]] // fri, sat, sun
    var visableAgendaItems: [[Session]] = [[],[],[]]
    
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        setupHeader()

        // Do any additional setup after loading the view.
        
        daysSegmentedControl.backgroundColor = .clear
        daysSegmentedControl.tintColor = .clear
        
        let attributes: [NSAttributedStringKey: Any] = [ NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        let cellnib = UINib(nibName: "SessionTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "sessionCell")
        
        
        if appDelegate.allSessions != nil {
            setupInitialAgendaItem()

        } else {
            //TODO: wait for call to finish then reload
            //add observer
        }
        daysSegmentedControl.selectedSegmentIndex = 0
        dayChanged(daysSegmentedControl)
    }
    
    func setupInitialAgendaItem() {
        
        allAgendaItems[0] = appDelegate.allSessions.allFridaySessions
        allAgendaItems[1] = appDelegate.allSessions.allSaturdaySessions
        allAgendaItems[2] = appDelegate.allSessions.allSundaySessions
        
        setupInitialAgendaItemsThatAreVisible()
    }
    
    func setupInitialAgendaItemsThatAreVisible() {
        //called once to set sessions based on subIDs
        var return2DArray: [[Session]] = [[],[],[]]
        
        for i in 0...allAgendaItems.count-1 {
            for j in 0...allAgendaItems[i].count-1 {
                let currentSess = allAgendaItems[i][j]
                if currentSess.isSubItem == false {
                    return2DArray[i].append(currentSess)
                }
            }
        }
        
        self.visableAgendaItems = return2DArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "agendaHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Agenda", subtitle:"June 21 - 23", imageURL: nil, image: headerImage, isProfile: false)
        
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
        self.selectedBarCenterOffsetConstraint.constant = offset

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func cellSelected(currentCell: SessionTableViewCell, indexPath: IndexPath) {
        
        guard let currentItem = currentCell.agendaItem else { return }

        //if cell is expandable expand/collapse it or if arrow button was tapped
        if currentItem.isExpandable {
            if currentItem.isExpanded {
                var numberOfItemsToRemove = currentItem.subIDs!.count
                var indexsToDelete:[IndexPath] = []
                
                for i in 1...numberOfItemsToRemove {
                    indexsToDelete.append(IndexPath(row: indexPath.row + i, section: 0))
                }
                while numberOfItemsToRemove > 0 {
                    visableAgendaItems[daysSegmentedControl.selectedSegmentIndex].remove(at: indexPath.row + 1)
                    numberOfItemsToRemove -= 1
                }
                tableView.beginUpdates()
                tableView.deleteRows(at: indexsToDelete, with: UITableViewRowAnimation.automatic)
                
                tableView.endUpdates()
                //tableView.reloadData()
                currentItem.isExpanded = false
                UIView.animate(withDuration: 0.5, animations: {
                    //TODO: image needs to be reset too? on scroll while expanded image gets stuck
                    currentCell.disclosureButton.transform = CGAffineTransform(rotationAngle: 0)
                    
                }, completion: { (_) in
                })
                
            } else {
                
                //find agenda items to insert
                var itemsToInsert:[Session] = []
                for id: String in currentItem.subIDs! {
                    for agendaItem: Session in allAgendaItems[daysSegmentedControl.selectedSegmentIndex] {
                        if id == agendaItem.id {
                            itemsToInsert.append(agendaItem)
                        }
                    }
                }
                if itemsToInsert.count > 0 {
                    visableAgendaItems[daysSegmentedControl.selectedSegmentIndex].insert(contentsOf: itemsToInsert, at: indexPath.row + 1)
                    var indexsToInsert:[IndexPath] = []
                    for index in indexPath.row + 1...indexPath.row + itemsToInsert.count {
                        indexsToInsert.append(IndexPath(row: index, section: 0))
                    }
                    tableView.beginUpdates()
                    tableView.insertRows(at: indexsToInsert, with: .automatic)
                    
                    tableView.endUpdates()
                    //                    tableView.reloadData()
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        currentCell.disclosureButton.transform = CGAffineTransform(rotationAngle: .pi/2)
                        
                    }, completion: { (_) in
                    })
                    
                    
                    currentItem.isExpanded = true
                    
                } else {
                    print("couldn't find any items with IDS:")
                    print(currentItem.subIDs!)
                    
                }
            }
        } else {
            //else push session details
            print("need to push session details")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SessionDetails") as? SessionDetailsViewController else { return }
            
            vc.agendaItem = currentCell.agendaItem
            present(vc, animated: true, completion: nil)

        }
    }

}

extension AgendaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return visableAgendaItems[daysSegmentedControl.selectedSegmentIndex].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as? SessionTableViewCell else {
            return UITableViewCell()
        }
        cell.shouldShowTime = false
        let currentItem = visableAgendaItems[daysSegmentedControl.selectedSegmentIndex][indexPath.row]
        
        cell.agendaItem = currentItem
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SessionTableViewCell
        self.cellSelected(currentCell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = .clear
    }
}

extension AgendaViewController: SessionCellDelegate {
    func didPressDisclosureButton(cell: SessionTableViewCell) {
        
        guard let cellsItem = cell.agendaItem else {
            print("wtf?")
            return
        }
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            print("couldn't find cell")
            return
        }
        
        if cellsItem.isExpandable {
            self.cellSelected(currentCell: cell, indexPath: indexPath)
            return
        }
        
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: cellsItem.id)
        
        if isEnrolled {
            appDelegate.removeSession(sessionID: cellsItem.id)
        } else {
            appDelegate.enrollInSession(sessionID: cellsItem.id)
        }
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}

 class AgendaItem: NSObject {
    
    var startTime: String?
    var endTime: String?
    var sessionName: String!
    var location: String!
    var id: String!
    var subItems:[String]!
    var agengdaDescription: String!
    //added
   // var personID: [String]!
    var isExpandable = false
    
    var isExpanded = false
    
    var isSubItem = false

}

