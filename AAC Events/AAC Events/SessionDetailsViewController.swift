//
//  SessionDetailsViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/25/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import SafariServices

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
    
    var facilitators: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupRoundButton()
        setupLabels()
        setupHeader()
        
        tableView.estimatedSectionFooterHeight = 0
        let cellnib = UINib(nibName: "ImageLabelTableViewCell", bundle: nil)
        tableView.register(cellnib, forCellReuseIdentifier: "imageLabelCell")

        if agendaItem.evaluationURL == nil || agendaItem.evaluationURL!.isEmpty {
            sessionEvalButtonHeightConstraint.constant = 0
        } else {
            sessionEvalButtonHeightConstraint.constant = 44
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //find people for given ID
        let appD = UIApplication.shared.delegate as! AppDelegate
        
        var facilitatorsForSession: [Person] = []
        if let allPeople = appD.allPeople {
            
            for peopleList in allPeople {
                for person in peopleList.peopleArray {
                    for ids in person.sessionIDs {
                        if ids == agendaItem.id {
                            facilitatorsForSession.append(person)
                            break
                        }
                    }
                }
            }
            self.facilitators = facilitatorsForSession
            self.tableView.reloadData()
        

        }
        
        
    }
    func setupRoundButton() {
        
        plusView.layer.cornerRadius = plusView.frame.width/2
        plusView.backgroundColor = .black
        plusView.layer.borderColor = UIColor.black.cgColor
        plusView.layer.borderWidth = 1
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: agendaItem.id)
        
        if isEnrolled {
            plusButton.setImage(#imageLiteral(resourceName: "checkSessionDetails"), for: .normal)
        } else {
            plusButton.setImage(#imageLiteral(resourceName: "plusSessionDetails"), for: .normal)
        }

    }
    
    func setupLabels() {
        
        let margins = 20
        
        let tableWidth = UIScreen.main.bounds.size.width - CGFloat(margins)
        //description
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableWidth - 32, height: 9999999))
        label.font = UIFont(name: "Avenir-Book", size: 15)
        label.text = agendaItem.sessionDescription
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.sizeToFit()
        label.frame.size.height = label.frame.height //more padding for description
        var viewFrame = label.frame
        viewFrame.size.width = label.frame.width + 32
        let view = UIView(frame: viewFrame)
        view.addSubview(label)
        label.center = view.center
        tableView.tableHeaderView = view
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        locationLabel.text = agendaItem.location
        dayDateLabel.text = dateFormatter.string(from: agendaItem.startDate!)
        
        if agendaItem.startDate != nil && agendaItem.endDate != nil {
            let hourFormmater = DateFormatter()
            hourFormmater.dateFormat = "h:mm"
            hourFormmater.locale = Locale(identifier: "en_US")
            let start = hourFormmater.string(from: agendaItem.startDate!)
            hourFormmater.dateFormat = "h:mm a"
            timeLabel.text = start + " - " + hourFormmater.string(from: agendaItem.endDate!)
        } else { timeLabel.text = "??????" }
    }
    func setupHeader() {
        
//        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()
        
        let imageNamesToRandomizeForHeader = ["Session1",
                                              "Session2",
                                              "Session3",
                                              "Session4",
                                              "Session5",
                                              "Session6",
                                              "Session7",
                                              "Session8",
                                              "Session9",
                                              "Session10"]
        
        let rando = Int(arc4random()) % imageNamesToRandomizeForHeader.count
        let image = UIImage(named: imageNamesToRandomizeForHeader[rando])
        let hView = header.createHeader(title: agendaItem.title, subtitle:nil, imageURL: nil, image: image, isProfile: false)
        
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
        if let url = URL(string: agendaItem.evaluationURL!) {
            let sfVC = SFSafariViewController(url: url)
            self.present(sfVC, animated: true, completion: nil)
        }
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
            image = #imageLiteral(resourceName: "plusSessionDetails")
            
        } else {
            appDelegate.enrollInSession(sessionID: id)
            image = #imageLiteral(resourceName: "checkSessionDetails")
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
        return facilitators[section].title
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 15)
		var title = ""
		if facilitators != nil && facilitators.count > 0 && facilitators[section] != nil {
			let person = facilitators[section]
			title = person.title

            

		}
        
        if title == "" {
            label.text = ""
        } else {
            label.text = "Speakers / Facilitators"
        }

        label.backgroundColor = .white
        return label
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if facilitators != nil {
            return facilitators.count
        }
        return 0
//        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = facilitators[indexPath.row]

        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageLabelCell", for: indexPath) as? ImageLabelTableViewCell else {
            return UITableViewCell()
        }

        cell.label?.text = person.name
        cell.label?.font = UIFont(name: "Avenir-Book", size: 15)
        cell.label?.backgroundColor = .white
        cell.logoImageView?.layer.cornerRadius = 44/2
        cell.logoImageView?.contentMode = .scaleAspectFill
        cell.logoImageView?.clipsToBounds = true

        if !person.imageName.isEmpty {
            cell.logoImageView.image = UIImage(named: person.imageName)
        } else if let url = URL(string: person.imageURL) {
            cell.logoImageView?.sd_setImage(with: url, completed: { (image, error, cahce, url) in
                if error == nil {
                    cell.logoImageView?.image = image
                    cell.logoImageView?.clipsToBounds = true
                    cell.setNeedsLayout()
                }
            })

        } else {
            cell.logoImageView?.image = UIImage(named: "noImage")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PersonDetails") as? PersonDetailsViewController else { return }
        
        vc.person = facilitators[indexPath.row]
        
        
        present(vc, animated: true, completion: nil)
        
   }
    
    
}


