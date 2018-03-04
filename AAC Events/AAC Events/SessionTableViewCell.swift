//
//  SessionTableViewCell.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

protocol SessionCellDelegate {
    func didPressDisclosureButton(cell: SessionTableViewCell)
}

class SessionTableViewCell: UITableViewCell {

    var agendaItem: Session! {
        didSet {
            setupCell()
        }
    }

    var shouldShowTime = false
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amPMLabel: UILabel! //is end time
    
    @IBOutlet weak var sessionNameLabel: UILabel!
    @IBOutlet weak var sessionDescriptionLabel: UILabel!
    @IBOutlet weak var disclosureButton: UIButton!
    
    var delegate: SessionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {

        if agendaItem.isSubItem && shouldShowTime == false {
            timeLabel.text = ""
            amPMLabel.text = ""
        } else {
            let dateForm = DateFormatter()
            dateForm.dateFormat = "h:mm a"
            
            if agendaItem.startDate != nil {
                timeLabel.text = dateForm.string(from: agendaItem.startDate!)
            } else { timeLabel.text = ""}
            
            if agendaItem.endDate != nil {
                amPMLabel.text = dateForm.string(from: agendaItem.endDate!)
            } else { amPMLabel.text = ""}
        }
        sessionNameLabel.text = agendaItem.title
        sessionDescriptionLabel.text = agendaItem.location
        
        var imageToUse = ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: agendaItem.id)
        
        if agendaItem.isExpandable {
            if agendaItem.isExpanded {
                imageToUse = "downArrow"
            } else  {
                imageToUse = "rightArrow"
            }
        } else {
            if isEnrolled {
                imageToUse = "checkMark"
            } else {
                imageToUse = "circlePlus"
            }
        }
        
        
        disclosureButton.setImage(UIImage(named: imageToUse), for: .normal)
        disclosureButton.transform = CGAffineTransform(rotationAngle: 0)
        disclosureButton.tintColor = .black
        selectionStyle = .none
    }
    @IBAction func disclosureButtonTapped(_ sender: Any) {
        
        delegate?.didPressDisclosureButton(cell: self)
    }
    
}

