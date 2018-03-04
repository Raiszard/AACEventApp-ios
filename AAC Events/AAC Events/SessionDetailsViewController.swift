//
//  SessionDetailsViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/25/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class SessionDetailsViewController: UIViewController {
    
    //table header contains session description text view
    //section header = people title
    //cells = people
    
    var agendaItem: Session!
    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayDateLabel: UILabel!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sessionEvalButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupRoundButton()
        setupLabels()
        setupHeader()
    }
    func setupRoundButton() {
        
        plusView.layer.cornerRadius = plusView.frame.width/2
        plusView.backgroundColor = .green
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: agendaItem.id)
        
        if isEnrolled {
            plusButton.setImage(#imageLiteral(resourceName: "checkMark"), for: .normal)
        } else {
            plusButton.setImage(#imageLiteral(resourceName: "circlePlus"), for: .normal)
        }

    }
    
    func setupLabels() {
        
        //description
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width, height: 9999999))
        label.text = agendaItem.sessionDescription//"Description goes hereDescription goes here Description goes here Description goes here Description goes hereDescription goes here Description goes here Description goes here Description goes here Description goes here Description goes here Description goes here\n"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.sizeToFit()
        label.frame.size.height = label.frame.height + 20 //more padding for description
        tableView.tableHeaderView = label
        
        let start = agendaItem.startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        
        locationLabel.text = agendaItem.location
        dayDateLabel.text = dateFormatter.string(from: agendaItem.startDate!)
        
//        if agendaItem.startTime != nil && agendaItem.endTime != nil {
//            timeLabel.text = agendaItem.startTime! + " " + agendaItem.endTime!
//        } else { timeLabel.text = "??????" }
    }
    func setupHeader() {
        
//        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: agendaItem.title, subtitle:nil, imageURL: nil, image: nil, isProfile: false)
        
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
    
    
    @IBAction func sessionEvaluationTapped(_ sender: Any) {
    }
    
    @IBAction func backPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func plusTapped(_ sender: Any) {
        
        guard let id = agendaItem.id else {
            print("no item id")
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: id)
        var image: UIImage!
        
        if isEnrolled {
            appDelegate.removeSession(sessionID: id)
            image = #imageLiteral(resourceName: "circlePlus")
            
        } else {
            appDelegate.enrollInSession(sessionID: id)
            image = #imageLiteral(resourceName: "checkMark")
        }

        UIView.animate(withDuration: 0.25, animations: {
            self.plusButton.alpha = 0.0
        }) { (finished) in
            self.plusButton.setImage(image, for: .normal)
            UIView.animate(withDuration: 0.25, animations: {
                self.plusButton.alpha = 1.0
            }, completion: nil)
        }
        
        guard let agendaVC = parent as? AgendaViewController else { return }
        agendaVC.tableView.reloadData()
        
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

extension SessionDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Facilitator"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: use global person data source with ID to populate this data
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        cell.textLabel?.text = "Person \(indexPath.row)"
        
        return cell
    }
    
    
    
}
